import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/filter_users/model/filter_model.dart';
import 'package:inakal/features/filter_users/screens/filtered_profile_screen.dart';

class FilterProfileService {
  final AuthController authController = Get.find();

  Future<FilterProfileModel?> getfilteredProfiles(BuildContext context) async {
    try {
      final response =
          await _sendPostRequest(url: filterProfileUrl + "1", fields: {});

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final responseJson = json.decode(responseData);
        final responseModel = FilterProfileModel.fromJson(responseJson);
        if (responseModel.type == "success") {
          _showSnackbar(context, responseModel.message ?? "");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FilteredProfileScreen(responseModel)));
        }
        return responseModel;
      } else {
        _showSnackbar(context, "error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
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
    Get.snackbar(
      "Message",
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }
}
