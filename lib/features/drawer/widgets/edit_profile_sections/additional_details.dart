import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/widgets/common/add_hobbie_widget.dart';
import 'package:inakal/features/drawer/widgets/common/option_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class AdditionalDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  AdditionalDetails(this.dropdownModel, {super.key});

  @override
  State<AdditionalDetails> createState() => _AdditionalDetailsState();
}

class _AdditionalDetailsState extends State<AdditionalDetails> {
  final userController = Get.find<UserDataController>();
  final TextEditingController aboutController = TextEditingController();
  String? selectedSmokingHabbit;
  String? selectedDrinkingHabbit;
  String? selectedFoodPreference;
  String? selectedCreatedFor;
  List<String> hobbies = ["Dancing", "Singing"];

  @override
  void initState() { 
    aboutController.text = userController.userData.value.user?.aboutMe ?? "";
    selectedSmokingHabbit = userController.userData.value.user?.smokingHabits ?? "";
    selectedDrinkingHabbit = userController.userData.value.user?.drinkingHabits ?? "";
    selectedFoodPreference = userController.userData.value.user?.foodPreferences ?? "";
    selectedCreatedFor = userController.userData.value.user?.created ?? "";
    super.initState();
    
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
                      }).toList(),
                      AddHobbieWidget(
                        label: "Add",
                        icon: Icons.add,
                        onPressed: () async {
                          final newLanguage = await showDialog<String>(
                            context: context,
                            builder: (context) {
                              final TextEditingController _controller =
                                  TextEditingController();
                              return AlertDialog(
                                title: Text("Add Hobbies"),
                                content: TextField(
                                  controller: _controller,
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
                                      final language = _controller.text.trim();
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
                    // widget.dropdownModel.states!
                    // .map((item) => item.name ?? "")
                    // .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSmokingHabbit = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Drinking Habbits - DropDown
                  EditProfileDropdown(
                    label: "Drinking Habbits",
                    items: ["No", "Yes", "Occasionally", "Any"],
                    // widget.dropdownModel.states!
                    // .map((item) => item.name ?? "")
                    // .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDrinkingHabbit = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Food Preferences - DropDown
                  EditProfileDropdown(
                    label: "Food Preferences",
                    items: ["Vegetarian", "Non-Vegetarian", "Vegan", "Any"],
                    // widget.dropdownModel.states!
                    // .map((item) => item.name ?? "")
                    // .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFoodPreference = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Profile Created For
                  EditProfileDropdown(
                    label: "Profile Created for",
                    items: [
                      "Myself",
                      "Daughter",
                      "Son",
                      "Sister",
                      "Brother",
                      "Friend",
                      "Relative"
                    ],
                    // widget.dropdownModel.states!
                    // .map((item) => item.name ?? "")
                    // .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCreatedFor = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(text: "Save Changes", onPressed: (){},)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
