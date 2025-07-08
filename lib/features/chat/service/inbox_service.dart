import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/chat/models/inbox_model.dart';

class InboxService {
  final AuthController authController = Get.find();

  // Fetch Inbox Users
  Future<InboxModel?> getInboxUsers(BuildContext context) async {
    try {
      final response = await _sendGetRequest(url: inboxTestUrl);
      print(response.statusCode);
      print(response.reasonPhrase);
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        final inboxModel = InboxModel.fromJson(responseJson);

        if (inboxModel.type == "success") {
          print('Inbox users fetched successfully');
          return inboxModel;
        } else {
          // Handle error case
          print('Error: ${inboxModel.message}');
          return null;
        }
      }
      return null;
    } catch (e) {
      print('Error fetching inbox users: $e');
      return null;
    }
  }

  // Helper method to send GET request
  Future<http.StreamedResponse> _sendGetRequest({
    required String url,
  }) async {
    final request = http.Request('GET', Uri.parse(url));
    return await request.send();
  }
}
