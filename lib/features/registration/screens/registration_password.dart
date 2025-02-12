import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/registration/widgets/text_field_widget.dart';

class RegistrationPassword extends StatefulWidget {
  const RegistrationPassword({super.key});

  @override
  State<RegistrationPassword> createState() => _RegistrationPasswordState();
}

class _RegistrationPasswordState extends State<RegistrationPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  bool isChecked = false;
  bool isPwdVisible = false;
  bool isCPwdVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _cpasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r"[A-Z]").hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r"[a-z]").hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r"[0-9]").hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  void showSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Please accept the Terms & Conditions'),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Confirm your password",
                      style: TextStyle(
                        fontSize: 29.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Ensure Security & Access",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    TextFieldWidget(
                      controller: _passwordController,
                      hintText: 'Password',
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
                      validator: _validatePassword,
                    ),
                    TextFieldWidget(
                      controller: _cpasswordController,
                      hintText: 'Confirm password',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required';
                        } else if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text("Agree the T&C and complete the ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal)),
                    const Text("registration with the mobile number",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal)),
                    const Text("+91 96XXX XXX99",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                            focusColor: AppColors.black,
                            activeColor: AppColors.primaryRed,
                          ),
                          const SizedBox(height: 16),
                          const Text('I Agree to the Terms and Conditions'),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: "Register",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (isChecked) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) =>
                                const BottomNavBarScreen()));
                          } else {
                            showSnackbar(context);
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
