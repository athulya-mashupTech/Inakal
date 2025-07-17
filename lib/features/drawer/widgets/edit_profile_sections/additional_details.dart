import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/common/add_hobbie_widget.dart';
import 'package:inakal/features/drawer/widgets/common/option_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class AdditionalDetails extends StatefulWidget {
  const AdditionalDetails({super.key});

  @override
  State<AdditionalDetails> createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
  final userController = Get.find<UserDataController>();
  final TextEditingController aboutController = TextEditingController();
  String? selectedSmokingHabbit;
  String? selectedDrinkingHabbit;
  String? selectedFoodPreference;
  String? selectedCreatedBy;
  List<String> hobbies = [];

  bool isSaving = false;

  @override
  void initState() {
    aboutController.text = userController.userData.value.user?.aboutMe ?? "";
    selectedSmokingHabbit =
        formatLabel(userController.userData.value.user?.smokingHabits ?? "");
    selectedDrinkingHabbit =
        formatLabel(userController.userData.value.user?.drinkingHabits ?? "");
    selectedFoodPreference =
        formatLabel(userController.userData.value.user?.foodPreferences ?? "");
    selectedCreatedBy =
        userController.userData.value.user?.profileCreatedBy ?? "";
    hobbies = (userController.userData.value.user?.hobbies ?? "").split(",");
    super.initState();
  }

  String formatLabel(String value) {
    return value
        .replaceAll('_', ' ') // Replace underscores with spaces
        .split(' ')
        .map((word) => word
            .split('-') // Handle hyphenated parts
            .map((part) => part.isNotEmpty
                ? part[0].toUpperCase() + part.substring(1).toLowerCase()
                : '')
            .join('-'))
        .join(' ');
  }

  String formatBackToKey(String label) {
    return label
        .trim()
        .replaceAll(' ', '_') // Spaces → underscores
        .toLowerCase(); // Lowercase everything
  }

  @override
  void dispose() {
    aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgsoftpink,
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        title: const Text('Additional Details'),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About me - multiline TextField
                  EditProfileTextFeild(
                    label: 'About me',
                    controller: aboutController,
                    maxlines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Hobbies
                  Text("Hobbies",
                      style: TextStyle(color: AppColors.grey, fontSize: 14)),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: [
                      ...hobbies.map((language) {
                        return OptionWidget(
                          label: language,
                          icon: Icons.close,
                          onPressed: () {
                            setState(() {
                              hobbies.remove(language);
                            });
                          },
                        );
                      }),
                      AddHobbieWidget(
                        label: "Add",
                        icon: Icons.add,
                        onPressed: () async {
                          final newLanguage = await showDialog<String>(
                            context: context,
                            builder: (context) {
                              final TextEditingController controller =
                                  TextEditingController();
                              return AlertDialog(
                                title: Text("Add Hobbies"),
                                content: TextField(
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: "Enter your hobbies",
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      final language = controller.text.trim();
                                      if (language.isNotEmpty) {
                                        Navigator.pop(context, language);
                                      }
                                    },
                                    child: Text("Add"),
                                  ),
                                ],
                              );
                            },
                          );

                          if (newLanguage != null && newLanguage.isNotEmpty) {
                            setState(() {
                              hobbies.add(newLanguage);
                            });
                          }
                        }, // Can be empty since the outer GestureDetector handles it
                      )
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Smoking Habbits - DropDown
                  EditProfileDropdown(
                    label: "Smoking Habbits",
                    items: ["No", "Yes", "Occasionally", "Any"],
                    onChanged: (value) {
                      setState(() {
                        selectedSmokingHabbit = value;
                      });
                    },
                    selectedValue: selectedSmokingHabbit,
                  ),
                  const SizedBox(height: 16),

                  // Drinking Habbits - DropDown
                  EditProfileDropdown(
                    label: "Drinking Habbits",
                    items: ["No", "Yes", "Occasionally", "Any"],
                    onChanged: (value) {
                      setState(() {
                        selectedDrinkingHabbit = value;
                      });
                    },
                    selectedValue: selectedDrinkingHabbit,
                  ),
                  const SizedBox(height: 16),

                  // Food Preferences - DropDown
                  EditProfileDropdown(
                    label: "Food Preferences",
                    items: ["Vegetarian", "Non-Vegetarian", "Vegan", "Any"],
                    onChanged: (value) {
                      setState(() {
                        selectedFoodPreference = value;
                      });
                    },
                    selectedValue: selectedFoodPreference,
                  ),
                  const SizedBox(height: 16),

                  // Profile Created For
                  EditProfileDropdown(
                    label: "Profile Created for",
                    items: [
                      "My Self",
                      "Daughter",
                      "Son",
                      "Sister",
                      "Brother",
                      "Friend",
                      "Relative"
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCreatedBy = value;
                      });
                    },
                    selectedValue: selectedCreatedBy,
                  ),
                  const SizedBox(height: 16),
                  isSaving
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryRed,
                            ),
                          ),
                        )
                      : CustomButton(
                          text: "Save Changes",
                          onPressed: () async {
                            setState(() {
                              isSaving = true;
                            });
                            await EditProfileService()
                                .updateAdditionalDetails(
                                    about_me: aboutController.text,
                                    hobbies: hobbies.join(","),
                                    smoking_habits: formatBackToKey(
                                        selectedSmokingHabbit ?? ""),
                                    drinking_habits: formatBackToKey(
                                        selectedDrinkingHabbit ?? ""),
                                    food_preferences: formatBackToKey(
                                        selectedFoodPreference ?? ""),
                                    profile_created_by: selectedCreatedBy ?? "",
                                    context: context)
                                .then((value) {
                              setState(() {
                                isSaving = false;
                              });
                            });
                          },
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
