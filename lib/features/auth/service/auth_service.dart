import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/model/login_model.dart';
import 'package:inakal/features/auth/model/register_model.dart';

class AuthService {
  // Register Function
  Future<RegisterModel?> registerUser({
    required String firtName,
    required String lastName,
    required String countryCode,
    required String phone,
    required String email,
    required String address,
    required String district,
    required String state,
    required String country,
    required String pincode,
    required String dob,
    required String gender,
    required String religion,
    required String caste,
    required String birthStar,
    required String description,
    required String hobbies,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await _sendPostRequest(url: registerUrl, fields: {
        "first_name": firtName,
        "last_name": lastName,
        "country_code": countryCode,
        "phone": phone,
        "email": email,
        "address": address,
        "district": district,
        "state": state,
        "country": country,
        "pincode": pincode,
        "dob": dob,
        "gender": gender,
        "religion": religion,
        "caste": caste,
        "birth_star": birthStar,
        "description": description,
        "hobbies": hobbies,
        "password": password,
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final registerModel = RegisterModel.fromJson(jsonResponse);

        if (registerModel.message == "success") {
          _showSnackbar(
              context, "Registration successful: ${registerModel.message}");
        } else {
          _showSnackbar(
              context, "Registration failed: ${registerModel.message}");
        }

        return registerModel;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      // Handle error
      print("Error: $e");
      return null;
    }
  }

  Future<LoginModel?> loginUser({
    required String countryCode,
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await _sendPostRequest(url: loginUrl, fields: {
        "country_code": countryCode,
        "phone": phone,
        "password": password
      });
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final loginModel = LoginModel.fromJson(jsonResponse);
        if (loginModel.token != "") {
          _showSnackbar(context, "Successfully Logined");
        } else {
          _showSnackbar(context, "login denied");
        }
        return loginModel;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
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
