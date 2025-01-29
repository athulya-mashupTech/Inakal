import 'package:flutter/material.dart';
import 'package:inakal/features/registration/screens/image_upload_screen.dart';
import 'package:inakal/features/registration/widgets/registration_loader.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/features/registration/widgets/custom_hobbies.dart';
import 'package:inakal/features/registration/screens/registrationform.dart';
import 'package:inakal/constants/app_constants.dart';

/// The `RegistrationHobbies` widget represents a screen where users can select up to 5 hobbies.
/// This helps personalize the user's experience by matching them with others with similar interests.
class RegistrationHobbies extends StatefulWidget {
  @override
  _RegistrationHobbiesState createState() => _RegistrationHobbiesState();
}

class _RegistrationHobbiesState extends State<RegistrationHobbies> {
  // List of available hobbies/interests.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
        child: Form(
          child: ListView(
            children: [
              const RegistrationLoader(progress: 2),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageUploadScreen(),
                    ),
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