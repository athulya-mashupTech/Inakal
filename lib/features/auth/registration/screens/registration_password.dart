import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/registration/screens/registrationform.dart';
import 'package:inakal/features/auth/registration/widgets/dropdown_feild.dart';
import 'package:inakal/features/auth/registration/widgets/registration_loader.dart';
import 'package:inakal/features/auth/registration/widgets/text_field_widget.dart';

class RegistrationPassword extends StatefulWidget {
  const RegistrationPassword({super.key});

  @override
  State<RegistrationPassword> createState() => _RegistrationPasswordState();
}

class _RegistrationPasswordState extends State<RegistrationPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  bool isPwdVisible = false;
  bool isCPwdVisible = false;
  bool _accepted = false;
  final TextEditingController _profileCreatedForController =
      TextEditingController();

  initState() {
    super.initState();
    _profileCreatedForController.text = "Myself";
  }

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

  final AuthController regController = Get.find();
  void _storePassword() {
    regController.setPassword(_passwordController.text);
    regController.setProfileCreatedFor(_profileCreatedForController.text);
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const RegistrationLoader(progress: 1),
                    const SizedBox(height: 30),
                    const Text(
                      "Confirm your password",
                      style: TextStyle(
                        fontSize: 26.0,
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
                    const SizedBox(height: 5),
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
                    const SizedBox(height: 5),
                    DropdownWidget(
                        label: "Profile Created for",
                        items: [
                          "Myself",
                          "Son",
                          "Daughter",
                          "Friend",
                          "Cousin",
                          "Brother",
                          "Sister"
                        ],
                        controller: _profileCreatedForController),

                    const SizedBox(height: 10),
                    // const SizedBox(height: 15),
                    // const Text("Agree to the T&C and complete the ",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.normal)),
                    // const Text("registration with the mobile number",
                    //     style: TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.normal)),
                    // const Text("+91 96XXX XXX99",
                    //     style: TextStyle(
                    //         fontSize: 21, fontWeight: FontWeight.bold)),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    //   child: Row(
                    //     children: [
                    //       Checkbox(
                    //         value: isChecked,
                    //         onChanged: (bool? value) {
                    //           setState(() {
                    //             isChecked = value ?? false;
                    //           });
                    //         },
                    //         focusColor: AppColors.black,
                    //         activeColor: AppColors.primaryRed,
                    //       ),
                    //       // const SizedBox(width: 4),
                    //       const Expanded(
                    //         child: Text('I Agree to the Terms and Conditions'),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _accepted,
                          onChanged: (value) {
                            setState(() {
                              _accepted = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(text: 'I accept the '),
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                    color: AppColors.primaryRed,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Terms and Conditions'),
                                          backgroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          content: SingleChildScrollView(
                                            child: Text(
                                              '''You must be at least 18 years old to use this app. This platform is intended solely for matrimonial purposes and should not be used for any other intent.

All personal data you provide must be truthful and accurate to ensure the safety and integrity of our community. While we aim to maintain a secure environment, we do not take responsibility for individual user interactions.

Your data may be used to enhance and improve our services. Any form of harassment or abuse will result in the immediate suspension of your account.

You have the right to delete your account at any time. Please note that we reserve the right to modify these terms and conditions without prior notice. Continued use of the platform signifies your acceptance of any updates to these terms.

If you have any concerns or require clarification, please contact our support team.''',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: Text('Close'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomButton(
                      text: "Register",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!_accepted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please accept the Terms and Conditions"),
                              ),
                            );
                            return;
                          } else {
                            _storePassword();
                            Get.to(
                              RegistrationForm(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 800),
                            );
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 20),
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
