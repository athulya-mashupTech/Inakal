import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/home/model/send_interest_model.dart';

class HomeService {
  final AuthController authController = Get.find();

  Future<SendInterestModel?> sentInterestToUser(
      String interest_client_id, BuildContext context) async {
    final response = await _sendPostRequest(url: sendInterestUrl, fields: {
      "interest_client_id": interest_client_id,
    });

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(
          responseBody); // Assuming the response is already in JSON format
      final sentInterestModel = SendInterestModel.fromJson(jsonResponse);
      if (sentInterestModel.type == "success") {
        // Show success message
        print("success");
        _showSnackbar(context, sentInterestModel.message!);
      } else {
        // Show error message
        print("failed");
        _showSnackbar(context, sentInterestModel.message!);
      }
      return sentInterestModel;
    } else {
      print("Error: ${response.statusCode}");
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
