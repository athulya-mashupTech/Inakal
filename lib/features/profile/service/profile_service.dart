import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/profile/model/profile_model.dart';

class ProfileService {
  Future<ProfileModel?> fetchProfileDetails(
      {required BuildContext context}) async {
    try {
      // final response = await _sendPostRequest(url: profileUrl, fields: {});
      final response = await http.get(Uri.parse(profileUrl));

      if (response.statusCode == 200) {
      // final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(response.body);
      final profileModel = ProfileModel.fromJson(jsonResponse);

      if (profileModel.type == 'success') {
        _showSnackbar(context, "profile details fetched successfully");
      } else {
        _showSnackbar(context, "profile details fetching failed");
      }
      return profileModel;
      }
      return null;
    } catch (e) {
      print(e);
      _showSnackbar(context, "profile details fetching failed");
      return null;
    }
  }
}

// Helper method to send POST request
Future<http.StreamedResponse> _sendPostRequest({
  required String url,
  required Map<String, String> fields,
}) async {
  final request = http.MultipartRequest('POST', Uri.parse(url));
  request.fields.addAll(fields);
  return await request.send();
}

// Method to show Snackbar
void _showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
