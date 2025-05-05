import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/profile/model/other_profile_model.dart';

class OtherProfileService {
  final AuthController authController = Get.find();

  Future<OtherProfileModel?> getOtherProfile(
      String userId, BuildContext context) async {
    try {
      final response = await _sendPostRequest(
          url: otherProfileUrl, fields: {"userid": userId});
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final otherProfileModel = OtherProfileModel.fromJson(jsonResponse);
        if (otherProfileModel.type == "success") {
          _showSnackbar(context, otherProfileModel.message!);
          print(otherProfileModel.gallery?.length);
        }
        return otherProfileModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(context, "Failed to fetch user profile.");
        return null;
      }
    } catch (e) {
      print("Error in fetching user profile: $e");
      return null;
    }
  }

  Future<String?> getRequestStatus(String clientId) async {
    try {
      final response = await _sendPostRequest(
          url: getRequestStatusUrl, fields: {"clientid": clientId});
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        return jsonResponse['status'];
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error in fetching request status: $e");
      return null;
    }
  }

  // Helper method to send POST request
  Future<http.StreamedResponse> _sendPostRequest({
    required String url,
    required Map<String, String> fields,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(fields);
    final token =
        authController.token.value; // Get the token from AuthController
    final headers = {
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);
    return await request.send();
  }

  // Method to show Snackbar
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
