import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/drawer/model/liked_profile_model.dart';

class LikedProfileService {
  final AuthController authController = Get.find();

  Future<LikedProfileModel?> getLikedProfile(
      {required BuildContext context}) async {
    try {
      final response = await _sendGetRequest(url: likedProfileUrl);

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final likedProfileModel = LikedProfileModel.fromJson(jsonResponse);

        if (likedProfileModel.type == "success") {
          _showSnackbar(context, "Liked Profile Data Fetched");
        } else {
          _showSnackbar(context, "Liked profile data fetching failed");
        }
        return likedProfileModel;
      } else {
        _showSnackbar(context, "Error: ${response.statusCode}");
        debugPrint(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Helper method to send GET request
  Future<http.StreamedResponse> _sendGetRequest({
    required String url,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
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
