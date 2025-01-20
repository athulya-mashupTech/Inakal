import 'package:flutter/material.dart';
import 'package:inakal/common/screen/otp_check_screen.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MobileNoCheckScreen extends StatefulWidget {
  @override
  _MobileNoCheckScreenState createState() => _MobileNoCheckScreenState();
}

class _MobileNoCheckScreenState extends State<MobileNoCheckScreen> {
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.pinkWhiteGradient,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColors.white,
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
                  Text(
                    'Phone Number Verification',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We\'ll need your phone number to send an OTP for verification.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  // TextField(
                  // controller: _mobileController,
                  // keyboardType: TextInputType.phone,
                  // decoration: InputDecoration(
                  //   hintText: 'Enter Mobile Number',
                  //   contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Added padding
                  //   border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  //   borderSide: BorderSide(color: AppColors.primaryRed)
                  //   ),
                  // ),
                  // ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your onPressed code here!
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OTPValidateScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: AppColors.primaryRed),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -100,
              child: Image.asset(
                'assets/vectors/dotted_design1.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
