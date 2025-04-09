import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/model/login_model.dart';
import 'package:inakal/features/auth/model/register_model.dart';
import 'package:inakal/features/auth/model/user_registration_data_model.dart';

class AuthService {
  // Register Function
  Future<RegisterModel?> registerUser({
    required UserRegistrationDataModel userData,
    required BuildContext context,
  }) async {
    try {
      print(
          """fistname: ${userData.userFirstName},
           lastname: ${userData.userLastName}, 
           countryCode: ${userData.userCountryCode}, 
           phone: ${userData.userPhoneNumber}, 
           email: ${userData.userEmail}, 
           address: ${userData.userAddress}, 
           district: ${userData.userDistrict}, 
           state: ${userData.userState}, 
           country: ${userData.userCountry}, 
           password: ${userData.userPassword}, 
           religion: ${userData.userReligion}, 
           caste: ${userData.userCaste}, 
           birthstar: ${userData.userBirthStar}, 
           description: ${userData.userDescription}, 
           hobbies: ${userData.userHobbies}
           profileCreatedFor: ${userData.userProfileCreatedFor},
           maritalStatus: ${userData.maritalStatus}""");
           
      final response = await _sendPostRequest(url: registerUrl, fields: {
        "first_name": userData.userFirstName!,
        "last_name": userData.userLastName!,
        "country_code": userData.userCountryCode!,
        "phone": userData.userPhoneNumber!,
        "email": userData.userEmail!,
        "address": userData.userAddress!,
        "district": userData.userDistrict!,
        "state": userData.userState!,
        "country": userData.userCountry!,
        // "pincode": userData.userPincode!,
        // "dob": userData.userDob!,
        // "gender": userData.userGender!,
        // "religion": userData.userReligion!,
        // "caste": userData.userCaste!,
        // "birth_star": userData.userBirthStar!,
        // "description": userData.userDescription!,
        // "hobbies": userData.userHobbies!,
        // "marital_status": userData.maritalStatus!,
        // "profile_created_for": userData.userProfileCreatedFor!,
        "password": userData.userPassword!,
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
