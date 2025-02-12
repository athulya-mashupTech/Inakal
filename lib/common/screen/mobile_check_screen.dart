import 'package:flutter/material.dart';
import 'package:inakal/common/screen/otp_check_screen.dart';
import 'package:inakal/common/widgets/custom_button.dart';
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
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            
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
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                  ),
                  const SizedBox(height: 10),

                  // CustomButton(
                  CustomButton(
                    text: "Send OTP", 
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => OTPValidateScreen()));}, 
                    color: AppColors.primaryRed,
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
