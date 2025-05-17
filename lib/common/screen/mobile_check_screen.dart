import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/screen/otp_check_screen.dart';
import 'package:inakal/common/services/mobile_number_check_service.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/common/widgets/no_internet_checker.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/login/screens/login_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MobileNoCheckScreen extends StatefulWidget {
  @override
  _MobileNoCheckScreenState createState() => _MobileNoCheckScreenState();
}

class _MobileNoCheckScreenState extends State<MobileNoCheckScreen> {
  String _countryCode = '';
  String _phoneNumber = '';

  final AuthController regController = Get.find();
  void _storeData() {
    regController.setMobileNumber(_phoneNumber, _countryCode);
  }

  Future<void> mobileVerification() async {
    await MobileNumberCheckService().mobilenumberexists(
        countryCode: _countryCode, PhoneNumber: _phoneNumber, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height),
            Positioned(
              bottom: -100,
              child: Image.asset(
                'assets/vectors/dotted_design1.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: AppColors.pinkWhiteGradient,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo/inakal_logo.png',
                    // height: 100,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Phone Number Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'We\'ll need your phone number to send an OTP for verification.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _countryCode = value.countryCode;
                        _phoneNumber = value.number;
                      });
                    },
                    initialCountryCode: 'IN',
                  ),
                  const SizedBox(height: 10),

                  // CustomButton(
                  CustomButton(
                    text: "Send OTP",
                    onPressed: () {
                      //Store the phone number and country code in the UserRegistrationData Class
                      _storeData();
                      mobileVerification();
                    },
                    color: AppColors.primaryRed,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
