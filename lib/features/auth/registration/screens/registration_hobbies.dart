import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/screen/mobile_check_screen.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/login/screens/login_page.dart';
import 'package:inakal/features/auth/model/register_model.dart';
import 'package:inakal/features/auth/registration/screens/registration_description.dart';
import 'package:inakal/features/auth/registration/widgets/registration_loader.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/features/auth/registration/widgets/custom_hobbies.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/service/auth_service.dart';
import 'package:lottie/lottie.dart';

class RegistrationHobbies extends StatefulWidget {
  const RegistrationHobbies({super.key});

  @override
  _RegistrationHobbiesState createState() => _RegistrationHobbiesState();
}

class _RegistrationHobbiesState extends State<RegistrationHobbies> {
  bool isLoading = false;
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
  final TextEditingController customHobbyController = TextEditingController();

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else if (selectedInterests.length < 5) {
        selectedInterests.add(interest);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You can only select up to 5 hobbies.")),
        );
      }
    });
  }

  void addCustomHobby() {
    final hobby = customHobbyController.text.trim();
    if (hobby.isNotEmpty && !interests.contains(hobby)) {
      setState(() {
        interests.add(hobby);
        if (selectedInterests.length < 5) {
          selectedInterests.add(hobby);
        }
        customHobbyController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter a unique hobby.")),
      );
    }
  }

  final AuthController regController = Get.find();

  _storeHobbies() {
    regController.setHobbies(selectedInterests.toList());
  }

  Future<RegisterModel?> _registerUser() async {
    return await AuthService()
        .registerUser(userData: regController.user.value, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
        child: Form(
          child: ListView(
            children: [
              const RegistrationLoader(progress: 4),
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

              const SizedBox(height: 5),

              // Hobbies selection grid
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

              const SizedBox(height: 10),
              const Text(
                "Didn't find your hobby? Add it here",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),

              // Custom hobby input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: customHobbyController,
                  decoration: InputDecoration(
                    hintText: "Enter your hobby",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0), // 👈 Inner padding
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryRed, width: 1.5),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        addCustomHobby();
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Continue Button
              isLoading
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    )
                  : CustomButton(
                      text: "Continue",
                      onPressed: () async {
                        _storeHobbies();
                        setState(() {
                          isLoading = true;
                        });
                        await _registerUser().then((value) async {
                          if (value != null && value.type == "success") {
                            Get.offAll(LoginPage());
                          } else {
                            // Show dialog
                            setState(() {
                              isLoading = false;
                            });
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // Prevent dismissing by tapping outside
                              builder: (_) => Dialog(
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Lottie.asset(
                                            "assets/lottie/warning.json",
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4),
                                        Text(
                                          "Something went wrong!",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${(value ?? RegisterModel(message: "Registration Failed")).message}. Please try again.",
                                          style: TextStyle(fontSize: 14),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 20)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );

                            await Future.delayed(const Duration(seconds: 3));
                            Navigator.of(context).pop();
                            Get.offAll(() => MobileNoCheckScreen());
                          }
                        });
                      },
                    ),

              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
