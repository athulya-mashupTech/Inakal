import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/controller/registration_controller.dart';
import 'package:inakal/features/auth/registration/screens/registrationform.dart';
import 'package:inakal/features/auth/registration/widgets/dropdown_feild.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _accepted = false;
  final TextEditingController _profileCreatedForController =
      TextEditingController();

  initState() {
    super.initState();
    _profileCreatedForController.text = "Myself";
  }

  final RegistrationController regController = Get.find();
  void _storeData() {
    regController.setProfileCreatedFor(_profileCreatedForController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text(
                'Please read and accept the Terms and Conditions to continue.',
                style: TextStyle(
                    fontSize: 20,
                    height: 1.2,
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),

              // Scrollable Terms Area
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          const Text(
                            """You must be at least 18 years old to use this app. This platform is intended solely for matrimonial purposes and should not be used for any other intent.

All personal data you provide must be truthful and accurate to ensure the safety and integrity of our community. While we aim to maintain a secure environment, we do not take responsibility for individual user interactions.

Your data may be used to enhance and improve our services. Any form of harassment or abuse will result in the immediate suspension of your account.

You have the right to delete your account at any time. Please note that we reserve the right to modify these terms and conditions without prior notice. Continued use of the platform signifies your acceptance of any updates to these terms.

If you have any concerns or require clarification, please contact our support team.""",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 5),

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
                  const Expanded(
                    child: Text(
                      'I accept the Terms and Conditions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
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
              CustomButton(
                  text: "Continue",
                  onPressed: () {
                    if (_accepted) {
                      // Proceed to the next step
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Terms accepted, proceeding...")),
                      );
                      _storeData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationForm()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please accept the terms.")),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
