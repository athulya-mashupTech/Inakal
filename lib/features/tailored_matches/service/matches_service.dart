import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/tailored_matches/model/tailored_matches_model.dart';

class MatchesService {
  final AuthController authController = Get.find();

  Future<TailoredMatchesModel> getTailoredMatches(BuildContext context) async {
    try {
      final response =
          await _sendPostRequest(url: relatedProfileUrl, fields: {});
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        final tailoredMatchesModel =
            TailoredMatchesModel.fromJson(responseJson);

        if (tailoredMatchesModel.type == "success") {
          _showSnackbar(context, tailoredMatchesModel.message ?? "");
          return tailoredMatchesModel;
        } else {
          _showSnackbar(context, tailoredMatchesModel.message ?? "");
        }
      }
      return TailoredMatchesModel();
    } catch (e) {
      print(e);
      return TailoredMatchesModel();
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
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 3),
    );
  }
}
