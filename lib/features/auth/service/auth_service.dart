import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:inakal/features/auth/model/auth_dropdown_model.dart';
import 'package:inakal/features/auth/model/districts_search_model.dart';
import 'package:inakal/features/drawer/model/caste_subcaste_options_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/common/model/user_data_model.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/features/auth/login/screens/login_page.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/model/login_model.dart';
import 'package:inakal/features/auth/model/register_model.dart';
import 'package:inakal/features/auth/model/sent_otp_model.dart';
import 'package:inakal/features/auth/model/user_registration_data_model.dart';
import 'package:inakal/features/auth/model/profile_completion_status_model.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/model/gallery_images_model.dart';
import 'package:inakal/common/controller/user_data_controller.dart';

class AuthService {
  final box = GetStorage();

  // ------------------ Register User ------------------
  Future<RegisterModel?> registerUser({
    required UserRegistrationDataModel userData,
    required BuildContext context,
  }) async {
    try {
      print(userData.userProfileCreatedFor ?? "Not got!");
      final response = await _sendPostRequest(
        url: registerUrl,
        fields: {
          "first_name": (userData.userFirstName ?? "").trim(),
          "last_name": (userData.userLastName ?? "").trim(),
          "email": userData.userEmail ?? "",
          "password": userData.userPassword ?? "",
          "country_code": userData.userCountryCode ?? "",
          "phone": userData.userPhoneNumber ?? "",
          "address": userData.userAddress ?? "",
          "district": userData.userDistrict ?? "",
          "state": userData.userState ?? "",
          "country": userData.userCountry ?? "",
          "religion": userData.userReligion ?? "",
          "caste": userData.userCaste ?? "",
          "sub_caste ": userData.userSubcaste ?? "",
          "no_of_children": userData.noOfChildren ?? "0",
          "star_sign": userData.userBirthStar ?? "",
          "about_me": userData.userDescription ?? "",
          "hobbies": userData.userHobbies ?? "",
          "profile_created_by": userData.userProfileCreatedFor ?? "",
          "marital_status": userData.maritalStatus ?? "",
          "zipCode": userData.userPincode ?? "",
          "dob": userData.userDob ?? "",
          "gender": userData.userGender ?? "",
        },
      );

      final result = await _parseResponse<RegisterModel>(
          response, (json) => RegisterModel.fromJson(json));

      if (result != null) {
        print(result.message ?? "");
        if (result.type == "success") {
          _showSnackbar(
              context, "Please log in to continue and access your account",
              title: "Registration Successful");
          Get.to(() => const LoginPage());
          return result;
        } else {
          return result;
        }
      }
      return null;
    } catch (e) {
      print("Register Error: $e");
      return null;
    }
  }

  // ------------------ Send OTP ------------------
  Future<String?> sentOtp(
      BuildContext context, String countryCode, String phone) async {
    try {
      final response = await _sendPostRequest(
        url: sentOtpUrl,
        fields: {
        "phone": phone, 
        "country_code": countryCode},
      );

      final result = await _parseResponse<SentOtpModel>(
          response, (json) => SentOtpModel.fromJson(json));

      if (result?.type == "success") {
        _showSnackbar(context, result?.message ?? "");
        return result?.otp?.toString();
      }
    } catch (e) {
      _showSnackbar(context, "Failed to send OTP");
      print("Send OTP Error: $e");
    }
    return null;
  }

  // ------------------ Login via OTP ------------------
  Future<LoginModel> verifyLoginOtp(BuildContext context, String countryCode,
      String phone, String otp) async {
    try {
      final response = await _sendPostRequest(
        url: verifyOtpUrl,
        fields: {
          "phone": phone, 
          "country_code": countryCode, 
          "otp": otp
          },
      );

      final result = await _parseResponse<LoginModel>(
          response, (json) => LoginModel.fromJson(json));

      if (result?.token?.isNotEmpty == true) {
        await _onLoginSuccess(result!);
        _showSnackbar(context, "Successfully Logged In");
        Get.offAll(() => const BottomNavBarScreen());
      } else {
        _showSnackbar(context, "Login denied");
      }
      return result ?? LoginModel();
    } catch (e) {
      _showSnackbar(context, "OTP Verification failed");
      print("OTP Error: $e");
      return LoginModel(type: "danger");
    }
  }

  // ------------------ Login via Password ------------------
  Future<LoginModel?> loginUser({
    required String countryCode,
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final response = await _sendPostRequest(
        url: loginUrl,
        fields: {
          "country_code": countryCode,
          "phone": phone,
          "password": password,
        },
      );

      final result = await _parseResponse<LoginModel>(
          response, (json) => LoginModel.fromJson(json));

      if (result?.token?.isNotEmpty == true) {
        await _onLoginSuccess(result!);
        _showSnackbar(context, "Successfully Logged In");
        Get.offAll(() => const BottomNavBarScreen());
      } else {
        _showSnackbar(context, "Invalid credentials");
      }
      return result;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  // ------------------ Fetch User Details ------------------
  Future<void> fetchUserDetails(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token') ?? "";

      if (token.isEmpty) return;

      final userController = Get.find<UserDataController>();

      // User Profile
      final userProfileResponse = await _authRequest(userProfileUrl, token);
      final userModel =
          UserDataModel.fromJson(json.decode(userProfileResponse));
      userController.setUserData(userModel);

      // Gallery
      final galleryResponse = await _authRequest(galleryImagesUrl, token);
      final galleryModel =
          GalleryImagesModel.fromJson(json.decode(galleryResponse));
      userController.setGalleryImages(galleryModel);

      // Dropdown
      final dropdownResponse = await _authRequest(dropdownOptionsUrl, token);
      final dropdownModel =
          await DropdownModel.fromJson(json.decode(dropdownResponse));
      userController.setDropDownData(dropdownModel);
    } catch (e) {
      print("Fetch User Data Error: $e");
    }
  }

  // ------------------ Profile Completion ------------------
  Future<double?> getProfileCompletionStatus(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? "";

      if (token.isEmpty) return null;

      final response = await _authRequest(profileCompletionStatusUrl, token);

      final model = ProfileCompletionStatusModel.fromJson(
        json.decode(response),
      );

      if (model.type == "success") {
        return model.profileCompletion?.toDouble() ?? 0.0;
      } else {
        _showSnackbar(context, model.message ?? "Unknown error");
        return 0.0;
      }
    } catch (e) {
      print("Profile Status Error: $e");
      return null;
    }
  }

  //---------------- Get Districts----------------
  Future<DistrictsSearchModel> getDistricts(String districtText) async {
    try {
      final response = await _sendPostRequest(
          url: getSearchedDistrictsUrl,
          fields: {"searchDistrict": districtText});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        final searchedDistrictsModel =
            DistrictsSearchModel.fromJson(responseJson);

        if (searchedDistrictsModel.type == "success") {
          print(
              "Length: ${(searchedDistrictsModel.districts?.length).toString()}");
          return searchedDistrictsModel;
        } else
          return DistrictsSearchModel();
      }
      return DistrictsSearchModel();
    } catch (e) {
      print(e);
      return DistrictsSearchModel();
    }
  }

  //------------------------- Get Castes and SubCastes ----------------------
  Future<CasteSubcasteOptionsModel> getCasteSubcasteOptions(
      String religionId) async {
    try {
      final response = await _sendPostRequest(
          url: getCasteSubcastesUrl, fields: {"religion_id": religionId});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        final casteSubcasteoptionsModel =
            CasteSubcasteOptionsModel.fromJson(responseJson);

        if (casteSubcasteoptionsModel.type == "success") {
          print(
              "Caste Length: ${(casteSubcasteoptionsModel.castes?.length).toString()}, Subcaste Length: ${(casteSubcasteoptionsModel.castes?.length).toString()}");
          return casteSubcasteoptionsModel;
        } else
          return CasteSubcasteOptionsModel();
      }
      return CasteSubcasteOptionsModel();
    } catch (e) {
      print(e);
      return CasteSubcasteOptionsModel();
    }
  }

  //---------------- Get Auth Options----------------
  Future<AuthDropdownModel> getAuthOptions() async {
    try {
      final response =
          await _sendPostRequest(url: getAllDropdownOptionsUrl, fields: {});

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseJson = json.decode(responseBody);
        final authDropdownModel = AuthDropdownModel.fromJson(responseJson);
        return authDropdownModel;
      }
      return AuthDropdownModel();
    } catch (e) {
      print(e);
      return AuthDropdownModel();
    }
  }

  // ------------------ Helpers ------------------
  Future<http.StreamedResponse> _sendPostRequest({
    required String url,
    required Map<String, String> fields,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(fields);
    return await request.send();
  }

  Future<String> _authRequest(String url, String token) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll({'Authorization': 'Bearer $token'});
    final response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception("Failed request: $url, Status: ${response.statusCode}");
    }
  }

  Future<T?> _parseResponse<T>(
    http.StreamedResponse response,
    T Function(Map<String, dynamic>) parser,
  ) async {
    final body = await response.stream.bytesToString();
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      return parser(json.decode(body));
    }
    return null;
  }

  Future<void> _onLoginSuccess(LoginModel model) async {
    box.write('isLoggedIn', true);
    final authController = Get.find<AuthController>();
    await authController.saveAuthData(model.token!, model.userId!);
    await fetchUserDetails(model.token!);
  }

  void _showSnackbar(BuildContext context, String message,
      {String? title = "Message"}) {
    Get.snackbar(
      title ?? "Message",
      message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }
}
