import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/registration/widgets/text_field_widget.dart';

class RegistrationPassword extends StatefulWidget {
  const RegistrationPassword({super.key});

  @override
  State<RegistrationPassword> createState() => _RegistrationPasswordState();
}

class _RegistrationPasswordState extends State<RegistrationPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _cpasswordController.dispose();
    _mobileController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
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
                    suffixIcon: const Icon(Icons.visibility_off),
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  TextFieldWidget(
                    controller: _cpasswordController,
                    hintText: 'Confirm password',
                    suffixIcon: const Icon(Icons.visibility_off),
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Text("Agree the T&C and complete the ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                  const Text("registration with the mobile number",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                  const Text("+91 96XXX XXX99",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  // const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
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
                  const CustomButton(text: "Register")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
