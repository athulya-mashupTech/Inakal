import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/home/model/related_profile_model.dart';
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
      final jsonResponse = json.decode(responseBody);
      final sentInterestModel = SendInterestModel.fromJson(jsonResponse);
      if (sentInterestModel.type == "success") {
        _showSnackbar(context, sentInterestModel.message!);
      } else {
        print("failed");
        _showSnackbar(context, sentInterestModel.message!);
      }
      return sentInterestModel;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }

  Future<void> toggleLikedBy(String clientid, BuildContext context) async {
    // Implement the logic to toggle the likedBy status
    // This could involve updating the state or making an API call
    print("liked by: $clientid");
    final response = await _sendPostRequest(url: toggelLikedbyUrl, fields: {
      "client_id": clientid,
    });
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final sentInterestModel = SendInterestModel.fromJson(jsonResponse);
      if (sentInterestModel.type == "success") {
        // Show success message
        print("toggleLikedBysuccess");
        // _showSnackbar(context, sentInterestModel.message!);
      } else {
        // Show error message
        print("toggleLikedByfailed");
        // _showSnackbar(context, sentInterestModel.message!);
      }
    } else {
      print("toggleLikedByError: ${response.statusCode}");
    }
  }

  Future<RelatedProfileModel?> getRelatedProfile(
      {required BuildContext context}) async {
    try {
      final response = await _sendPostRequest(url: relatedProfileUrl, fields: {});
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final relatedProfileModel = RelatedProfileModel.fromJson(jsonResponse);

        if (relatedProfileModel.type == "success") {
          // _showSnackbar(context, "Related Profile Data Fetched");
        } else {
          _showSnackbar(context, "Related profile data fetching faied");
        }
        return relatedProfileModel;
      } else {
        _showSnackbar(context, "Error: ${response.statusCode}");
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
    final request = http.MultipartRequest('GET', Uri.parse(url));
    final token =
        authController.token.value; // Get the token from AuthController
    final headers = {
      'Authorization': 'Bearer $token',
    };
    request.headers.addAll(headers);
    return await request.send();
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
