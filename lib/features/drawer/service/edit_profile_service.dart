import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/common/model/user_data_model.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/model/user_registration_data_model.dart';
import 'package:inakal/features/drawer/model/user_data_update_model.dart.dart';

class EditProfileService {
  final AuthController authController = Get.find();

  // profile data update
  Future<UserDataUpdateModel?> updateProfileDetails({
    required UserDataModel userData,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userProfileUpdateUrl, fields: {
        "first_name": userData.user!.firstName!,
        "last_name": userData.user!.lastName!,
        "country_code": userData.user!.countryCode!,
        "phone": userData.user!.phone!,
        "email": userData.user!.email!,
        "dob": userData.user!.dob!,
        "gender": userData.user!.gender!
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final userDataUpdateModel = UserDataUpdateModel.fromJson(jsonResponse);
        
        if (userDataUpdateModel.type == "success") {
          _showSnackbar(context, userDataUpdateModel.message!);
        }
        return userDataUpdateModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(context, "Failed to update profile. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error in editProfileService: $e");
      return null;
    }
  }

  // Personal details update
  Future<UserDataUpdateModel?> updatePersonalDetails({
    required UserDataModel userData,
    required BuildContext context,
  }) async {
    try {
      print("${userData.user?.languagesKnown!}"
          .split(',')
          .map((lang) => {'"value"': '"${lang.trim()}"'})
          .toList()
          .toString());
      print(
          '[{"value":"English"}, {"value":"Malayalam"}, {"value":"Hindi"}, {"value":"Kannada"}]');
      final response =
          await _sendPostRequest(url: userPersonalUpdateUrl, fields: {
        "height": userData.user!.height!,
        "weight": userData.user!.weight!,
        "religion": userData.user!.religion!,
        "caste": userData.user!.caste!,
        "sub_caste": userData.user!.subCaste!,
        "star_sign": userData.user!.starSign!,
        "mother_tongue": userData.user!.motherTongue!,
        "marital_status": userData.user!.maritalStatus!,
        "languages_known": "${userData.user?.languagesKnown!}"
          .split(',')
          .map((lang) => {'"value"': '"${lang.trim()}"'})
          .toList()
          .toString(),
        "number_of_children": userData.user!.numberOfChildren!,
      });
      print(response.reasonPhrase);

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final userDataUpdateModel = UserDataUpdateModel.fromJson(jsonResponse);
        if (userDataUpdateModel.type == "success") {
          _showSnackbar(context, userDataUpdateModel.message!);
        }
        return userDataUpdateModel;
      } else {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        print("Error: ${jsonResponse["message"]}");
        _showSnackbar(
            context, "Failed to update Personal Details. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error in Personal Details Service: $e");
      return null;
    }
  }

  // education and professional update
  Future<UserDataUpdateModel?> updateEducationAndProfessionalDetails({
    required UserDataModel userData,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userEduProfUpdateUrl, fields: {
        "highest_education": userData.user!.highestEducation!,
        "education_details": userData.user!.educationDetails!,
        "occupation": userData.user!.occupation!,
        "annual_income": userData.user!.annualIncome!,
        "work_location": userData.user!.workLocation!
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final userDataUpdateModel = UserDataUpdateModel.fromJson(jsonResponse);
        if (userDataUpdateModel.type == "success") {
          _showSnackbar(context, userDataUpdateModel.message!);
        }
        return userDataUpdateModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(context,
            "Failed to update Educational and Professional Details. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error in editProfileService: $e");
      return null;
    }
  }

// family details update
  Future<UserDataUpdateModel?> updateFamilyDetails({
    required UserDataModel userData,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userFamilyUpdateUrl, fields: {
        "family_type": userData.user!.familyType!,
        "mothers_occupation": userData.user!.mothersOccupation!,
        "fathers_occupation": userData.user!.fathersOccupation!,
        "number_of_siblings": userData.user!.numberOfSiblings!,
        "siblings_marital_status": userData.user!.siblingsMaritalStatus!,
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final userDataUpdateModel = UserDataUpdateModel.fromJson(jsonResponse);
        if (userDataUpdateModel.type == "success") {
          _showSnackbar(context, userDataUpdateModel.message!);
        }
        return userDataUpdateModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(
            context, "Failed to update Family Details. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error in FamilyDetails Service: $e");
      return null;
    }
  }

// Location details update
  Future<UserDataUpdateModel?> updateLocationDetails({
    required UserDataModel userData,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userLocationUpdateUrl, fields: {
        "address": userData.user!.address!,
        "district": userData.user!.district!,
        "state": userData.user!.state!,
        "country": userData.user!.country!,
        "zipCode": userData.user!.zipCode!,
        "current_city": userData.user!.currentCity!,
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final userDataUpdateModel = UserDataUpdateModel.fromJson(jsonResponse);
        if (userDataUpdateModel.type == "success") {
          _showSnackbar(context, userDataUpdateModel.message!);
        }
        return userDataUpdateModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(
            context, "Failed to update Location Details. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error in Location Details Service: $e");
      return null;
    }
  }

//Additional details update
  Future<UserDataUpdateModel?> updateAdditionalDetails({
    required UserDataModel userData,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userAdditionalDetailUpdateUrl, fields: {
        "about_me": userData.user!.aboutMe!,
        "hobbies": "${userData.user?.hobbies!}"
          .split(',')
          .map((lang) => {'"value"': '"${lang.trim()}"'})
          .toList()
          .toString(),
        "smoking_habits": userData.user!.smokingHabits!,
        "drinking_habits": userData.user!.drinkingHabits!,
        "food_preferences": userData.user!.foodPreferences!,
        "profile_approved": userData.user!.profileApproved!,
        "profile_created_by": userData.user!.profileCreatedBy!,
        "instagram_link": userData.user!.instagramLink!,
        "facebook_link": userData.user!.facebookLink!,
        "linkedin_link": userData.user!.linkedinLink!,
        "youtube_link": userData.user!.youtubeLink!,
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final userDataUpdateModel = UserDataUpdateModel.fromJson(jsonResponse);
        if (userDataUpdateModel.type == "success") {
          _showSnackbar(context, userDataUpdateModel.message!);
        }
        return userDataUpdateModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(
            context, "Failed to update Additional Details. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error in Additional Details Service: $e");
      return null;
    }
  }

// preference details update
  Future<UserDataUpdateModel?> updatePreferencenDetails({
    required UserDataModel userData,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userPreferenceUpdateUrl, fields: {
        "preferred_age": userData.user!.preferredAgeRange!,
        "preferred_height_range": userData.user!.preferredHeightRange!,
        "preferred_religion": userData.user!.preferredReligion!,
        "preferred_caste": userData.user!.preferredCaste!,
        "preferred_smoking_habits": userData.user!.preferredSmokingHabits!,
        "preferred_drinking_habits": userData.user!.preferredDrinkingHabits!,
        "preferred_food_preferences": userData.user!.preferredFoodPreferences!,
        "preferred_qualification": userData.user!.preferredQualification!,
        "score": userData.user!.score!,
      });

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        final userDataUpdateModel = UserDataUpdateModel.fromJson(jsonResponse);
        if (userDataUpdateModel.type == "success") {
          _showSnackbar(context, userDataUpdateModel.message!);
        }
        return userDataUpdateModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(
            context, "Failed to update Preference Details. Please try again.");
        return null;
      }
    } catch (e) {
      print("Error in preference Details Service: $e");
      return null;
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
