import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/registration/widgets/registration_loader.dart';
import 'package:inakal/features/auth/registration/widgets/text_field_widget.dart';
import 'package:inakal/features/auth/service/auth_service.dart';

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

  void _storePassword() {
    UserRegistrationData.userPassword = _passwordController.text;
  }

  void _registerUser() {
    AuthService().registerUser(
        firtName: UserRegistrationData.userFirstName!,
        lastName: UserRegistrationData.userLastName!,
        countryCode: UserRegistrationData.userCountryCode!,
        phone: UserRegistrationData.userPhoneNumber!,
        email: UserRegistrationData.userEmail!,
        address: UserRegistrationData.userAddress!,
        district: UserRegistrationData.userDistrict!,
        state: UserRegistrationData.userState!,
        country: UserRegistrationData.userCountry!,
        pincode: UserRegistrationData.userPincode!,
        dob: UserRegistrationData.userDob!,
        gender: UserRegistrationData.userGender!,
        religion: UserRegistrationData.userReligion!,
        caste: UserRegistrationData.userCaste!,
        birthStar: UserRegistrationData.userBirthStar!,
        description: UserRegistrationData.userDescription!,
        hobbies: UserRegistrationData.userHobbies!,
        password: UserRegistrationData.userPassword!,
        context: context);
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
                    const RegistrationLoader(progress: 4),
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
                    const SizedBox(height: 15),
                    const Text("Agree to the T&C and complete the ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal)),
                    const Text("registration with the mobile number",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal)),
                    const Text("+91 96XXX XXX99",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                          // const SizedBox(width: 4),
                          const Expanded(
                            child: Text('I Agree to the Terms and Conditions'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomButton(
                      text: "Register",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (isChecked) {
                            _storePassword();
                            _registerUser();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const BottomNavBarScreen(),
                            //   ),
                            // );
                          } else {
                            showSnackbar(context);
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
