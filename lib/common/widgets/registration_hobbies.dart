import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/common/widgets/custom_hobbies.dart';
import 'package:inakal/common/widgets/registrationform.dart';
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

  // Set to track selected interests to ensure no duplicates.
  final Set<String> selectedInterests = {};

  /// Toggles the selection state of a hobby.
  /// If the hobby is already selected, it will be removed; otherwise, it will be added.
  /// Limits selection to a maximum of 5 hobbies.
  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        // Remove interest if it is already selected.
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 5) {
        // Add interest if less than 5 are already selected.
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
              // Title text: instructs the user to select hobbies.
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

              // Subtitle text: explains the purpose of selecting hobbies.
              const Text(
                "This will help us to match you with the right people",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),

              // Wrap widget to display hobbies in a responsive grid-like layout.
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10, // Horizontal spacing between items
                  runSpacing: 10, // Vertical spacing between lines
                  children: interests.map((interest) {
                    return InterestItem(
                      interest: interest,
                      isSelected: selectedInterests.contains(interest),
                      onTap: () => toggleInterest(interest),
                    );
                  }).toList(),
                ),
              ),

              // Continue button: Navigates to the next screen when pressed.
              CustomButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationForm(),
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