import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/model/login_model.dart';
import 'package:inakal/features/auth/model/register_model.dart';

class AuthService {
  // Register Function
  Future<RegisterModel?> registerUser({
    required BuildContext context,
  }) async {
    try {
      print(
          "fistname: ${UserRegistrationData.userFirstName}, lastname: ${UserRegistrationData.userLastName}, countryCode: ${UserRegistrationData.userCountryCode}, phone: ${UserRegistrationData.userPhoneNumber}, email: ${UserRegistrationData.userEmail}, address: ${UserRegistrationData.userAddress}, district: ${UserRegistrationData.userDistrict}, state: ${UserRegistrationData.userState}, county: ${UserRegistrationData.userCountry}, password: ${UserRegistrationData.userPassword}");
      final response = await _sendPostRequest(url: registerUrl, fields: {
        "first_name": UserRegistrationData.userFirstName!,
        "last_name": UserRegistrationData.userLastName!,
        "country_code": UserRegistrationData.userCountryCode!,
        "phone": UserRegistrationData.userPhoneNumber!,
        "email": UserRegistrationData.userEmail!,
        "address": UserRegistrationData.userAddress!,
        "district": UserRegistrationData.userDistrict!,
        "state": UserRegistrationData.userState!,
        "country": UserRegistrationData.userCountry!,
        // "pincode": UserRegistrationData.userPincode!,
        // "dob": UserRegistrationData.userDob!,
        // "gender": UserRegistrationData.userGender!,
        // "religion": UserRegistrationData.userReligion!,
        // "caste": UserRegistrationData.userCaste!,
        // "birth_star": UserRegistrationData.userBirthStar!,
        // "description": UserRegistrationData.userDescription!,
        // "hobbies": UserRegistrationData.userHobbies!,
        "password": UserRegistrationData.userPassword!,
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final registerModel = RegisterModel.fromJson(jsonResponse);

        if (registerModel.type == "success") {
          _showSnackbar(
              context, "Registration successful: ${registerModel.message}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBarScreen(),
            ),
          );
        } else {
          _showSnackbar(
              context, "Registration failed: ${registerModel.message}");
        }

        return registerModel;
      } else if (response.statusCode == 400) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final registerModel = RegisterModel.fromJson(jsonResponse);
        _showSnackbar(context, "Registration failed: ${registerModel.message}");
        return null;
      } else {
        print("Error: ${response.statusCode} ${response.reasonPhrase}");
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBarScreen(),
            ),
          );
        } else {
          _showSnackbar(context, "login denied");
        }

        return loginModel;
      } else {
        _showSnackbar(context, "Login failed. No user found.");
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
