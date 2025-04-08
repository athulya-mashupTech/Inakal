import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/registration/screens/terms_and_conditions_screen.dart';
import 'package:pinput/pinput.dart';

class OTPValidateScreen extends StatefulWidget {
  const OTPValidateScreen({super.key});

  @override
  _OTPValidateScreenState createState() => _OTPValidateScreenState();
}

class _OTPValidateScreenState extends State<OTPValidateScreen> {
  final String _otp = '234567';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _errorText = '';

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: AppColors.otpblue, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(25, 0, 0, 0),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(-2, 3),
        ),
      ],
    ),
  );

  String _enteredOtp = '';

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
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 80),
                    const Text(
                      'Phone Number Verification',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Column(
                      children: [
                        Text(
                          'An OTP has been sent to your mobile number',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '+91 99XXX XXX33',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    OTPWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget OTPWidget() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            keyboardType: TextInputType.number,
            defaultPinTheme: defaultPinTheme,
            onChanged: (value) {
              setState(() {
                _enteredOtp = value;
                _errorText = '';
              });
            },
          ),
          if (_errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _errorText,
                style: const TextStyle(color: AppColors.primaryRed),
              ),
            ),
          const SizedBox(height: 10),
          ResendOTP(),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: CustomButton(
              text: "Verify OTP",
              onPressed: () {
                if (_enteredOtp.isEmpty || _enteredOtp.length < 6) {
                  setState(() {
                    _errorText = 'Please enter the 6-digit OTP';
                  });
                } else if (_enteredOtp != _otp) {
                  setState(() {
                    _errorText = 'Invalid OTP. Please try again.';
                  });
                } else {
                  // OTP is correct
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditionsScreen(),
                    ),
                  );
                }
              },
              color: AppColors.primaryRed,
            ),
          ),
        ],
      ),
    );
  }

  Widget ResendOTP() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn’t receive OTP?',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Resend Code',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryRed,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryRed,
          ),
        ),
      ],
    );
  }
}