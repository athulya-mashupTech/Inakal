import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart' show AppColors;
import 'package:inakal/features/auth/registration/widgets/text_field_widget.dart';

import 'login_page.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _newPasswordError;
  String? _confirmPasswordError;
  bool isPwdVisible = false;
  bool isCPwdVisible = false;

  void _validateAndSubmit() {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    setState(() {
      _newPasswordError = null;
      _confirmPasswordError = null;

      if (newPassword.isEmpty) {
        _newPasswordError = 'Please enter New password ';
      }
      if (confirmPassword.isEmpty) {
        _confirmPasswordError = 'confirm password cannot be empty';
      }
      if (_newPasswordError == null &&
          _confirmPasswordError == null &&
          newPassword != confirmPassword) {
        _confirmPasswordError = 'Passwords do not match';
      }
    });

    if (_newPasswordError == null && _confirmPasswordError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset successful")),
      );
      // Get.offAll(() => const LoginPage());
    }
  }

  void _validatePassword(String? value) {
    setState(() {
      if (value == null || value.isEmpty) {
        _newPasswordError = 'Password is required';
      } else if (value.length < 8) {
        _newPasswordError = 'Password must be at least 8 characters';
      } else if (!RegExp(r"[A-Z]").hasMatch(value)) {
        _newPasswordError = 'Password must contain at least one uppercase letter';
      } else if (!RegExp(r"[a-z]").hasMatch(value)) {
        _newPasswordError = 'Password must contain at least one lowercase letter';
      } else if (!RegExp(r"[0-9]").hasMatch(value)) {
        _newPasswordError = 'Password must contain at least one digit';
      } else {
        _newPasswordError = null; // Password is valid
      }
    });
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    const Center(
                      child: Text(
                        "Create a Secured Password",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Please enter your new password below.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 14),
                    TextFieldWidget(
                      controller: _newPasswordController,
                      hintText: "Enter Your New Password",
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
                      errorText: _newPasswordError,
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      controller: _confirmPasswordController,
                      hintText: "Re-Enter Your New Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isCPwdVisible = !isCPwdVisible;
                          });
                        },
                        icon: isCPwdVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: !isCPwdVisible,
                      errorText: _confirmPasswordError,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "Reset Password",
                      onPressed: () {
                        _validatePassword(_newPasswordController.text.trim());
                        if (_newPasswordError == null) {
                          _validateAndSubmit();
                        }
                      },
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
