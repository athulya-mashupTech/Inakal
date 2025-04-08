import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/features/auth/controller/registration_controller.dart';
import 'package:inakal/features/auth/registration/screens/registration_password.dart';
import 'package:inakal/features/auth/registration/widgets/registration_loader.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/features/auth/registration/widgets/custom_hobbies.dart';
import 'package:inakal/constants/app_constants.dart';

class RegistrationHobbies extends StatefulWidget {
  const RegistrationHobbies({super.key});

  @override
  _RegistrationHobbiesState createState() => _RegistrationHobbiesState();
}

class _RegistrationHobbiesState extends State<RegistrationHobbies> {
  final List<String> interests = [
    "Reading",
    "Photography",
    "Gaming",
    "Music",
    "Travel",
    "Painting",
    "Politics",
    "Charity",
    "Cooking",
    "Pets",
    "Sports",
    "Fashion",
    "Dance",
    "Fitness",
    "Gardening",
    "Movies",
    "Writing",
    "Yoga",
  ];

  final Set<String> selectedInterests = {};

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 5) {
        selectedInterests.add(interest);
      }
    });
  }

  final RegistrationController regController = Get.find();
  _storeHobbies() {
    regController.setHobbies(selectedInterests.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
        child: Form(
          child: ListView(
            children: [
              const RegistrationLoader(progress: 3),
              const SizedBox(height: 20),
              const Text(
                "Select upto 5 Hobbies",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryRed,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                "This will help us to match you with the right people",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: interests.map((interest) {
                    return InterestItem(
                      interest: interest,
                      isSelected: selectedInterests.contains(interest),
                      onTap: () => toggleInterest(interest),
                    );
                  }).toList(),
                ),
              ),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  _storeHobbies();
                  Get.to(
                      const RegistrationPassword(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 800),
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
