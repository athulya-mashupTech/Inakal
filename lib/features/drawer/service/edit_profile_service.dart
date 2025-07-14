import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/model/user_data_model.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/drawer/model/caste_subcaste_options_model.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/model/upload_profile_image_model.dart';
import 'package:inakal/features/drawer/model/user_data_update_model.dart.dart';

class EditProfileService {
  final AuthController authController = Get.find();

  Future<UploadProfileImageModel?> uploadProfileImage({
    required String filePath,
    required BuildContext context,
  }) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(userProfileImageUrl));

      request.files.add(await http.MultipartFile.fromPath('image', filePath));

      final token =
          authController.token.value; // Get the token from AuthController
      final headers = {
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(headers);

      final response = await request.send();

      if (response.statusCode == 200) {
        String responseData = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = jsonDecode(responseData);
        var uploadProfileImageModel =
            UploadProfileImageModel.fromJson(jsonResponse);
        if (uploadProfileImageModel.type == 'success') {
          _showSnackbar(context, 'Image uploaded successfully');
          String newImageUrl = uploadProfileImageModel.url!;

          final userController = Get.find<UserDataController>();
          userController.updateProfilePicture(newImageUrl);
        } else {
          _showSnackbar(context, "Failed to upload image");
        }
        return uploadProfileImageModel;
      } else {
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  // profile data update
  Future<UserDataUpdateModel?> updateProfileDetails({
    required String firstName,
    required String lastName,
    required String email,
    required String countryCode,
    required String phoneNumber,
    required String dob,
    required String gender,
    required BuildContext context,
  }) async {
    try {
      print("Code: ${countryCode.substring(1)}");
      final response =
          await _sendPostRequest(url: userProfileUpdateUrl, fields: {
        "first_name": firstName,
        "last_name": lastName,
        "country_code": countryCode.substring(1),
        "phone": phoneNumber,
        "email": email,
        "dob": dob,
        "gender": gender
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
    required String secondarynumber,
    required String height,
    required String weight,
    required String religion,
    required String caste,
    required String other_caste_subcaste,
    required String sub_caste,
    required String star_sign,
    required String mother_tongue,
    required String marital_status,
    required String number_of_children,
    required String languagesKnown,
    required BuildContext context,
  }) async {
    try {
      print("${languagesKnown}"
          .split(',')
          .map((lang) => {'"value"': '"${lang.trim()}"'})
          .toList()
          .toString());
      print(
          '[{"value":"English"}, {"value":"Malayalam"}, {"value":"Hindi"}, {"value":"Kannada"}]');

      final response =
          await _sendPostRequest(url: userPersonalUpdateUrl, fields: {
        "secondary_number": secondarynumber,
        "height": height,
        "weight": weight,
        "religion": religion,
        "caste": caste,
        "other_caste_subcaste": other_caste_subcaste,
        "sub_caste": sub_caste,
        "star_sign": star_sign,
        "mother_tongue": mother_tongue,
        "marital_status": marital_status,
        "languages_known": languagesKnown
            .split(',')
            .map((lang) => {'"value"': '"${lang.trim()}"'})
            .toList()
            .toString(),
        "number_of_children": number_of_children,
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
    required String highestEducation,
    required String qualification,
    required String educationalDetails,
    required String occupation,
    required String occupationDetails,
    required String annualIncome,
    required String workLocation,
    required BuildContext context,
  }) async {
    try {
      print(qualification);
      final response =
          await _sendPostRequest(url: userEduProfUpdateUrl, fields: {
        "highest_education": highestEducation,
        "qualification": qualification,
        "education_details": educationalDetails,
        "occupation": occupation,
        "occupational_details": occupationDetails,
        "annual_income": annualIncome,
        "work_location": workLocation
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
    required String familyType,
    required String mothersOccupation,
    required String fathersOccupation,
    required String numberOfSiblings,
    required String siblingsMaritalStatus,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userFamilyUpdateUrl, fields: {
        "family_type": familyType,
        "mothers_occupation": mothersOccupation,
        "fathers_occupation": fathersOccupation,
        "number_of_siblings": numberOfSiblings,
        "siblings_marital_status": siblingsMaritalStatus,
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

  //get DropDown Options
  Future<DropdownModel?> getDropdownOptions({
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: dropdownOptionsUrl, fields: {});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print("Response : $responseBody");
        final jsonResponse = json.decode(responseBody);
        final dropdownModel = DropdownModel.fromJson(jsonResponse);

        // Updating GetX data
        final user = User.fromJson(jsonResponse);
        final userData = UserDataModel(user: user);
        final userController = Get.find<UserDataController>();
        userController.setUserData(userData);
        // Updating GetX data

        return dropdownModel;
      } else {
        // print("Error: ${response.statusCode}");
        _showSnackbar(context, "Failed to fetch dropdown options");
        return null;
      }
    } catch (e) {
      print("Error in fetching dropdown options: $e");
      return null;
    }
  }

// Location details update
  Future<UserDataUpdateModel?> updateLocationDetails({
    required String address,
    required String city,
    required String district,
    required String state,
    required String country,
    required String zipcode,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userLocationUpdateUrl, fields: {
        "address": address,
        "district": district,
        "state": state,
        "country": country,
        "zipCode": zipcode,
        "current_city": city,
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
    required String about_me,
    required String hobbies,
    required String smoking_habits,
    required String drinking_habits,
    required String food_preferences,
    required String profile_created_by,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userAdditionalDetailUpdateUrl, fields: {
        "about_me": about_me,
        "hobbies": hobbies
            .split(',')
            .map((lang) => {'"value"': '"${lang.trim()}"'})
            .toList()
            .toString(),
        "smoking_habits": smoking_habits,
        "drinking_habits": drinking_habits,
        "food_preferences": food_preferences,
        "profile_created_by": profile_created_by,
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
    required String preferredAgeRange,
    required String preferredHeightRange,
    required String preferredReligion,
    required String preferredCaste,
    required String preferredSmokingHabits,
    required String preferredDrinkingHabits,
    required String preferredFoodPreferences,
    required String preferredQualification,
    required BuildContext context,
  }) async {
    try {
      final response =
          await _sendPostRequest(url: userPreferenceUpdateUrl, fields: {
        "preferred_age_range": preferredAgeRange,
        "preferred_height_range": preferredHeightRange,
        "preferred_religion": preferredReligion,
        "preferred_caste": preferredCaste,
        "preferred_smoking_habits": preferredSmokingHabits,
        "preferred_drinking_habits": preferredDrinkingHabits,
        "preferred_food_preferences": preferredFoodPreferences,
        "preferred_qualification": preferredQualification,
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

  // API to get Relegion Related Caste and Subcastes
  Future<CasteSubcasteOptionsModel> getCasteSubcasteOptions(
      BuildContext context, String religionId) async {
    try {
      final response = await _sendPostRequest(
          url: getCasteAndSubcasteOptionsUrl,
          fields: {"religion_id": religionId});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        final casteSubcasteOptionsModel =
            CasteSubcasteOptionsModel.fromJson(responseJson);

        if (casteSubcasteOptionsModel.type == "success") {
          // _showSnackbar(context, casteSubcasteOptionsModel.message ?? "");
        }
        return casteSubcasteOptionsModel;
      }
      return CasteSubcasteOptionsModel();
    } catch (e) {
      print(e);
      return CasteSubcasteOptionsModel();
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
    Get.snackbar(
      "Message",
      message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
    );
  }
}
