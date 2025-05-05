import 'package:flutter/material.dart';
import 'package:inakal/common/screen/otp_check_screen.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/login/screens/forgot_password.dart';
import 'package:inakal/features/auth/registration/widgets/text_field_widget.dart';
import 'package:inakal/features/auth/service/auth_service.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginpwdController = TextEditingController();
  String _countryCode = '';
  String _phoneNumber = '';
  bool isPwdVisible = false;

  void _loginUser() {
    AuthService().loginUser(
        countryCode: _countryCode.substring(1),
        phone: _phoneNumber,
        password: _loginpwdController.text,
        context: context);
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
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  gradient: AppColors.pinkWhiteGradient,
                ),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Login to continue your journey with us.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(),
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
                  TextFieldWidget(suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPwdVisible = !isPwdVisible;
                          });
                        },
                        icon: isPwdVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: !isPwdVisible,
                      controller: _loginpwdController, hintText: "Password"),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryRed,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    text: "Login",
                    onPressed: () {
                      _loginUser();

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const OTPValidateScreen()));
                    },
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
