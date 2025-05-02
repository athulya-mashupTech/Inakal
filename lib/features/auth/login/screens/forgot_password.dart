
import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/login/screens/password_reset_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var _otpStatus = false;
  final String _otp = "123456";
  String _countryCode = '';
  String _phoneNumber = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _errorText = '';
  String _otpErrorText = '';
  String _enteredOtp = '';

  void otpSent() {
    setState(() {
      _otpStatus = true;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                gradient: AppColors.pinkWhiteGradient,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        children: [
                          TextSpan(
                            text: 'Trouble  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: 'Logging In?',
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Enter your Phone Number and we'll send you an OTP to reset your password.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    //mobile number feild
                    IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(),
                        ),
                      ),

                      onChanged: (value) {
                        setState(() {
                          _countryCode = value.countryCode;
                          _phoneNumber = value.number;
                          _errorText = '';
                        });
                      },
                      initialCountryCode: 'IN',
                    ),
                    const SizedBox(height: 10),
                    // otp verification
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: _otpStatus
                          ? Column(
                              children: [
                                const Text(
                                    "Provide the OTP sent to your mobile number"),
                                const SizedBox(height: 10),
                                OTPWidget(),
                                const SizedBox(height: 15),
                              ],
                            )
                          : CustomButton(
                              text: "Send OTP",
                              onPressed: () {
                                if (_phoneNumber.isEmpty) {
                                  setState(() {
                                    _errorText =
                                        'Please enter your mobile number';
                                  });
                                } else {
                                  otpSent();
                                }
                              },
                              color: AppColors.primaryRed,
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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
                _otpErrorText = '';
              });
            },
          ),
          if (_otpErrorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _otpErrorText,
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
                    _otpErrorText = 'Please enter the 6-digit OTP';
                  });
                } else if (_enteredOtp != _otp) {
                  setState(() {
                    _otpErrorText = 'Invalid OTP. Please try again.';
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordResetScreen(),
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
