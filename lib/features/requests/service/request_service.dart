import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/requests/model/request_user_details_model.dart';
import 'package:inakal/features/requests/model/sent_request_model.dart';

class RequestService {
  final AuthController authController = Get.find();

  // Fetch all Sent Requests
  Future<List<RequestUserDetailsModel?>> getSentRequestUserDetails(
      BuildContext context) async {
    try {
      final response = await _sendPostRequest(url: sentRequestsUrl, fields: {});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final sentRequestModel = SentRequestModel.fromJson(jsonResponse);

        if (sentRequestModel.type == "success") {
          _showSnackbar(context, "Successfully fetched sent requests");

          // API call to collect data for each user detail request
          List<Future<RequestUserDetailsModel?>> userDetailsFutures =
              sentRequestModel.requests!.map((request) async {
            // Call the user details fetch API
            print("ID: ${request.toClientId!}");
            final userDetailsResponse = await _sendPostRequest(
              url: userDetailsFetchUrl,
              fields: {"userid": request.toClientId!},
            );

            if (userDetailsResponse.statusCode == 200) {
              final userBody = await userDetailsResponse.stream.bytesToString();
              final userJson = json.decode(userBody);
              print(userJson['user']['first_name']);  

              // Combine user details with match status
              return RequestUserDetailsModel?.fromJson(
                  userJson['user'], request.status!);
            } else {
              // Handle failed user fetch
              throw Exception(
                  "Failed to load user details for id ${request.toClientId}");
            }
          }).toList();

          // Wait for all user detail fetches to complete
          print("1 All Ok");
          return await Future.wait(userDetailsFutures);
        } else {
          _showSnackbar(
              context, sentRequestModel.type ?? "Error fetching requests");
          return [];
        }
      } else {
        _showSnackbar(context, "Error fetching sent requests");
        return [];
      }
    } catch (e) {
      print("Error fetching Sent requests: $e");
      return [];
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
