import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/filter_users/model/applied_filters_model.dart';
import 'package:inakal/features/filter_users/model/filter_model.dart';

class FilterProfileService {
  final AuthController authController = Get.find();

  String? extractCmRange(String input) {
    final regex = RegExp(r'\((\d+-\d+)\s*cm\)');
    final match = regex.firstMatch(input);
    return match != null ? match.group(1) : null;
  }

  String convertIncomeRange(String input) {
    final regex = RegExp(r'(\d+)\s*Lakh\s*-\s*(\d+)\s*Lakh');
    final match = regex.firstMatch(input);
    if (match != null) {
      final start = match.group(1);
      final end = match.group(2);
      return '$start-$end';
    }
    return '';
  }

  Map<String, String> filterBuilder(AppliedFiltersModel appliedFilters) {
    final userController = Get.find<UserDataController>();
    DropdownModel? dropdownModel = userController.dropdownModel.value;
    Map<String, String> filters = {};

    // Religion Mapping
    if (appliedFilters.filterReligion != "")
      filters["filter_religion"] = (dropdownModel.religions!
                  .firstWhere((religion) =>
                      religion.name == appliedFilters.filterReligion)
                  .id ==
              -1)
          ? ""
          : dropdownModel.religions!
                  .firstWhere((religion) =>
                      religion.name == appliedFilters.filterReligion)
                  .id ??
              "";

    // // Caste Mapping
    // if (appliedFilters.filterCaste != "")
    //   filters["filterCaste"] = appliedFilters.filterCaste.toString();
    // // SubCaste Mapping
    // if (appliedFilters.filterSubCaste != "")
    //   filters["filterSubCaste"] = appliedFilters.filterSubCaste.toString();

    // Age Mapping
    if (appliedFilters.filterAgeGroup != "")
      filters["filter_age_group"] = appliedFilters.filterAgeGroup;
    // Height Mapping
    if (extractCmRange(appliedFilters.filterHeight) != null)
      filters["filter_height"] = extractCmRange(appliedFilters.filterHeight)!;
    // print(extractCmRange(appliedFilters.filterHeight));
    // Weight Mapping
    if (appliedFilters.filterWeight != "")
      filters["filter_weight"] = appliedFilters.filterWeight;
    // State Mapping
    if (appliedFilters.filterState != "")
      filters["filter_state"] = (dropdownModel.states!
                  .firstWhere(
                      (state) => state.name == appliedFilters.filterState)
                  .id ==
              -1)
          ? ""
          : dropdownModel.states!
                  .firstWhere(
                      (state) => state.name == appliedFilters.filterState)
                  .id ??
              "";
    // Mother Tongue Mapping
    if (appliedFilters.filterMotherTongue != "")
      filters["filter_language"] = (dropdownModel.languages!
                  .firstWhere((language) =>
                      language.name == appliedFilters.filterMotherTongue)
                  .id ==
              -1)
          ? ""
          : dropdownModel.languages!
                  .firstWhere((language) =>
                      language.name == appliedFilters.filterMotherTongue)
                  .id ??
              "";
    // Marital Status Mapping
    if (appliedFilters.filterMaritalStatus != "")
      filters["filter_marital_status"] = appliedFilters.filterMaritalStatus;
    // Highest Education Mapping
    if (appliedFilters.filterEducation != "")
      filters["filter_education"] = (dropdownModel.highestEducations!
                  .firstWhere((education) =>
                      education.name == appliedFilters.filterEducation)
                  .id ==
              -1)
          ? ""
          : dropdownModel.highestEducations!
                  .firstWhere((education) =>
                      education.name == appliedFilters.filterEducation)
                  .id ??
              "";

    // // Occupation Mapping
    // if (appliedFilters.filterOccupation != "")
    //   filters["filter_occupation"] = appliedFilters.filterOccupation.toString();

    // Annual Income Mapping
    if (appliedFilters.filterAnnualIncome != "")
      // print(convertIncomeRange(appliedFilters.filterAnnualIncome));
      filters["filter_annual_income"] =
          convertIncomeRange(appliedFilters.filterAnnualIncome);

    // // Family Status Mapping
    // if (appliedFilters.fa != "")
    //   filters["filter_age_group"] = appliedFilters.fa;

    // Food Preference Mapping
    if (appliedFilters.filterFoodPreference != "")
      filters["filter_food_preference"] =
          appliedFilters.filterFoodPreference.toLowerCase();

    return filters;
  }

  Future<FilterProfileModel?> getfilteredProfiles(BuildContext context,
      int page, AppliedFiltersModel appliedFilters) async {
    try {
      Map<String, String> filters = {};
      filters = filterBuilder(appliedFilters);
      filters["page"] = "$page";

      print(filters);
      print("Done: " + filterProfileUrl);

      final response =
          await _sendPostRequest(url: filterProfileUrl, fields: filters);

      // print("Done: ${response.statusCode}");
      // _showSnackbar(context, response.reasonPhrase ?? "None");

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final responseJson = json.decode(responseData);
        print(responseData);
        final responseModel = FilterProfileModel.fromJson(responseJson);
        return responseModel;
      } else {
        _showSnackbar(context, "error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
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
    if (token == null || token.isEmpty) {
      print("Error: Token is null or empty");
      return Future.error("Unauthorized: Missing token");
    }

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data', // Add this
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
