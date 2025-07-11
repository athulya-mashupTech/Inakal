import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/common/model/mobile_number_check_model.dart';
import 'package:inakal/common/screen/otp_check_screen.dart';
import 'package:inakal/constants/config.dart';

class MobileNumberCheckService {
  Future<MobileNumberCheckModel?> mobilenumberexists(
      {required String countryCode,
      required String PhoneNumber,
      required BuildContext context}) async {
    try {
      final response =
          await _sendPostRequest(url: mobileNumberCheckUrl, fields: {
        "country_code": countryCode,
        "phone": PhoneNumber,
      });

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);
        final mobileNumberCheckModel =
            MobileNumberCheckModel.fromJson(jsonResponse);

        if (mobileNumberCheckModel.type == "success") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OTPValidateScreen(otp: mobileNumberCheckModel.otp.toString(),)));
          _showSnackbar(context, "mobile number verification success");
          return mobileNumberCheckModel;
        } else {
          _showSnackbar(context, mobileNumberCheckModel.message ?? "User already exist!");
        }
      }
    } catch (e) {
      print("Error in mobile number: $e");
    }
    return null;
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
    Get.snackbar(
      "Message",
      message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
    );
  }
}
