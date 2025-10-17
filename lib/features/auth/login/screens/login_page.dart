import 'package:flutter/material.dart';
import 'package:inakal/common/screen/mobile_check_screen.dart';
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
  bool isLoggedIn = false;
  final _formKey = GlobalKey<FormState>();
  String? _phoneError;

  void _loginUser() async {
    setState(() {
      isLoggedIn = true;
    });
    await AuthService()
        .loginUser(
            countryCode: _countryCode.substring(1),
            phone: _phoneNumber,
            password: _loginpwdController.text,
            context: context)
        .then((value) {
      if (value.type == "danger") {
        setState(() {
          isLoggedIn = false;
        });
      }
    });
  }

  void _validatePhonenumber() {
    setState(() {
      if (_phoneNumber.trim().isEmpty) {
        _phoneError = 'Phone number cannot be empty';
      } else {
        _phoneError = null;
      }
    });
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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/logo/inakal_logo.png',
                      // height: 100,
                      width: 200,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Login to continue your journey with us.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          IntlPhoneField(
                            validator: (value) async {
                              if (value != null && value.number == "") {
                                return "Phone number cannot be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(),
                                ),
                                errorText: _phoneError),
                            onChanged: (value) {
                              _validatePhonenumber();
                              setState(() {
                                _countryCode = value.countryCode;
                                _phoneNumber = value.number;
                              });
                            },
                            initialCountryCode: 'IN',
                          ),
                          const SizedBox(height: 10),
                          TextFieldWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
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
                              controller: _loginpwdController,
                              hintText: "Password"),
                        ],
                      ),
                    ),

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
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryRed,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    isLoggedIn
                        ? CircularProgressIndicator()
                        : CustomButton(
                            text: "Login",
                            onPressed: () {
                              _validatePhonenumber();
                              if (_formKey.currentState!.validate() &&
                                  _phoneNumber != "") {
                                _loginUser();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Please enter a valid mobile number & password.")),
                                );
                              }
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const OTPValidateScreen()));
                            },
                            color: AppColors.primaryRed,
                          ),
                    SizedBox(height: 15),

                    /// Sign Up Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?  ",
                          style: TextStyle(color: AppColors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MobileNoCheckScreen()));
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MobileNoCheckScreen()));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
