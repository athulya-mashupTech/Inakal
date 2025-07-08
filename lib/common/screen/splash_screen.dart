import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/model/user_data_model.dart';
import 'package:inakal/common/screen/onboarding_screen_1.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/common/widgets/no_internet_checker.dart';
import 'package:inakal/constants/config.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/login/screens/login_page.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/model/gallery_images_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  final box = GetStorage();
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();

    // Check if the user is logged in
    isLoggedIn = box.read('isLoggedIn') ?? false;

    print("before isLoggedIn: $isLoggedIn");
    if (isLoggedIn ?? false) {
      fetchDataToGetx();
    } else {
      _navigateToNextScreen();
    }

    isLoggedIn = box.read('isLoggedIn') ?? false;

    // Initialize the animation controller for fade effect
    _animationController = AnimationController(
      duration: Duration(seconds: 3), // Duration for the fade effect
      vsync: this,
    );

    // Create the fade animation for opacity
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation
    _animationController.forward();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NoInternetChecker(
          child: isLoggedIn ?? false
              ? const BottomNavBarScreen()
              : OnboardingScreen1(),
        ),
      ),
    );
  }

  Future<void> fetchDataToGetx() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    print("1");

    if (token != null && token.isNotEmpty) {
      final AuthController authController = Get.find();
      await authController.loadAuthData();

      final request = http.MultipartRequest('POST', Uri.parse(userProfileUrl));
      final headers = {
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(headers);
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);

        final userModel = UserDataModel.fromJson(jsonResponse);

        final userController = Get.find<UserDataController>();
        userController.setUserData(userModel);

        final galleryRequest =
            http.MultipartRequest('POST', Uri.parse(galleryImagesUrl));
        final headers = {
          'Authorization': 'Bearer $token',
        };
        galleryRequest.headers.addAll(headers);
        final galleryResponse = await galleryRequest.send();

        if (galleryResponse.statusCode == 200) {
          print("Gallery Succesfully Fetched");
          final galleryResponseBody =
              await galleryResponse.stream.bytesToString();
          final galleryJsonResponse = json.decode(galleryResponseBody);

          final galleryModel = GalleryImagesModel.fromJson(galleryJsonResponse);
          userController.setGalleryImages(galleryModel);
        } else {
          print("Gallery not Fetched");
        }

        // Load DropDown Data
        await EditProfileService()
            .getDropdownOptions(context: context)
            .then((value) {
          userController.setDropDownData(value ?? DropdownModel());
        });

        _navigateToNextScreen();
      } else if (response.statusCode == 401) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);

        final userModel = UserDataModel.fromJson(jsonResponse);

        print("User Model Message: ${userModel.isLoggedin}");
        if (userModel.isLoggedin == false) {
          await Future.delayed(const Duration(seconds: 3), () {});
          box.write('isLoggedIn', false);
          isLoggedIn = false;
          print("isLoggedIn: $isLoggedIn");
          Get.snackbar("Error", "${userModel.message}");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NoInternetChecker(
                child: LoginPage(),
              ),
            ),
          );
          return;
        } else {
          print("isLoggedIn: $isLoggedIn");
        }
      } else {
        print("Failed to fetch user profile");
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Center logo with fade effect
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Image.asset('assets/logo/inakal_logo.png'),
              ),
            ),
          ),
          // Heart pattern in bottom-right corner with fade effect
          Positioned(
            bottom: -100,
            right: -100,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Transform.rotate(
                angle: -45 * 3.1415927 / 180,
                child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/vectors/heart_pattern1.png'),
                  ),
                ),
              ),
            ),
          ),
          // Heart pattern in top-left corner with fade effect
          Positioned(
            top: -80,
            left: -80,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Transform.rotate(
                angle: 135 * 3.1415927 / 180,
                child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/vectors/heart_pattern1.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
