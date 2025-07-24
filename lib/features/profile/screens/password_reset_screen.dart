import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart' show AppColors;
import 'package:inakal/features/auth/registration/widgets/text_field_widget.dart';
import 'package:inakal/features/profile/service/reset_password_service.dart';
import 'package:lottie/lottie.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _newPasswordError;
  String? _confirmPasswordError;
  bool isPwdVisible = false;
  bool isCPwdVisible = false;
  bool isLoading = false;

  void _validateAndSubmit() async {
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
      setState(() {
        isLoading = true;
      });
      await ResetPasswordService()
          .resetPassword(_newPasswordController.text.trim())
          .then((value) {
        if (value.type == "success") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password reset successful")),
          );
          Navigator.pop(context);
        } else if (value.type == "danger") {
          setState(() {
            isLoading = false;
          });
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(17)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 22),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset("assets/lottie/password_exist.json",
                            height: 250, width: 250),
                        Text(
                          "Password Already in Use",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          "The new password you entered is the same as your current password. Please choose a different password to ensure better security.",
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: AppColors.black),
                                  ),
                                )))
                      ],
                    ),
                  ),
                ));
              });
        }
      });
    }
  }

  void _validatePassword(String? value) {
    setState(() {
      if (value == null || value.isEmpty) {
        _newPasswordError = 'Password is required';
      } else if (value.length < 8) {
        _newPasswordError = 'Password must be at least 8 characters';
      } else if (!RegExp(r"[A-Z]").hasMatch(value)) {
        _newPasswordError =
            'Password must contain at least one uppercase letter';
      } else if (!RegExp(r"[a-z]").hasMatch(value)) {
        _newPasswordError =
            'Password must contain at least one lowercase letter';
      } else if (!RegExp(r"[0-9]").hasMatch(value)) {
        _newPasswordError = 'Password must contain at least one digit';
      } else {
        _newPasswordError = null; // Password is valid
      }
    });
  }

  void _validateConfirmPassword(String? value) {
    setState(() {
      if (value == null || value.isEmpty) {
        _confirmPasswordError = 'Confirm Password is required';
      } else if (value.length < 8) {
        _confirmPasswordError = 'Confirm Password must be at least 8 characters';
      } else if (!RegExp(r"[A-Z]").hasMatch(value)) {
        _confirmPasswordError =
            'Confirm Password must contain at least one uppercase letter';
      } else if (!RegExp(r"[a-z]").hasMatch(value)) {
        _confirmPasswordError =
            'Confirm Password must contain at least one lowercase letter';
      } else if (!RegExp(r"[0-9]").hasMatch(value)) {
        _confirmPasswordError = 'Confirm Password must contain at least one digit';
      } else {
        _confirmPasswordError = null;
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
                    isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          )
                        : CustomButton(
                            text: "Reset Password",
                            onPressed: () {
                              _validatePassword(
                                  _newPasswordController.text.trim());
                              _validateConfirmPassword(
                                  _confirmPasswordController.text.trim());
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
