import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';

class PartnersPreferenceDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  PartnersPreferenceDetails(this.dropdownModel, {super.key});

  @override
  State<PartnersPreferenceDetails> createState() =>
      _PartnersPreferenceDetailsState();
}

class _PartnersPreferenceDetailsState extends State<PartnersPreferenceDetails> {
  final userController = Get.find<UserDataController>();

  String? selectedPreferredAgeRange;
  String? selectedPreferredReligion;
  String? selectedPreferredSmokingHabit;
  String? selectedPreferredFood;
  String? selectedPreferredHeightRange;
  String? selectedPreferredCaste;
  String? selectedPreferredDrinkingHabit;
  String? selectedPreferredQualification;
  bool isSaving = false;

  String formatToKey(String label) {
    RegExp regex = RegExp(r'\((\d{2,3}-\d{2,3}) cm\)');
    Match? match = regex.firstMatch(label);
    print(match);
    return match != null ? match.group(1)! : label;
  }

  String formatToLabel(String value) {
    List<String> parts = value.split('-');
    if (parts.length != 2) return value;

    int cmStart = int.tryParse(parts[0]) ?? 0;
    int cmEnd = int.tryParse(parts[1]) ?? 0;

    String cmToFeetInches(int cm) {
      double totalInches = cm / 2.54;
      int feet = totalInches ~/ 12;
      int inches = (totalInches % 12).round();

      // Normalize inches if 12 or more
      if (inches == 12) {
        feet += 1;
        inches = 0;
      }

      return "$feet'${inches}\"";
    }

    String converted =
        '${cmToFeetInches(cmStart)} - ${cmToFeetInches(cmEnd)} ($value cm)';

    if ('4\'6" - 4\'10" (137-147 cm)' == converted) {
      print("Yessss");
    }

    print(converted);
    print('4\'6" - 4\'10" (137-147 cm)');

    return converted;
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
  void initState() {
    selectedPreferredAgeRange =
        userController.userData.value.user?.preferredAgeRange ?? "";
    selectedPreferredReligion = widget.dropdownModel.religions!
            .firstWhere((religion) =>
                religion.id ==
                userController.userData.value.user?.preferredReligion)
            .name ??
        "";
    selectedPreferredSmokingHabit = formatLabel(
        userController.userData.value.user?.preferredSmokingHabits ?? "");
    selectedPreferredFood = formatLabel(
        userController.userData.value.user?.preferredFoodPreferences ?? "");
    selectedPreferredHeightRange = formatToLabel(
        userController.userData.value.user?.preferredHeightRange ?? "");
    selectedPreferredCaste = widget.dropdownModel.castes!
            .firstWhere((caste) =>
                caste.id == userController.userData.value.user?.preferredCaste)
            .name ??
        "";
    selectedPreferredDrinkingHabit = formatLabel(
        userController.userData.value.user?.preferredDrinkingHabits ?? "");
    selectedPreferredQualification = widget.dropdownModel.highestEducations!
            .firstWhere((qualification) =>
                qualification.id ==
                userController.userData.value.user?.preferredQualification)
            .name ??
        "";
    print(selectedPreferredAgeRange);
    print(selectedPreferredCaste);
    print(selectedPreferredDrinkingHabit);
    print(selectedPreferredFood);
    print(selectedPreferredHeightRange);
    print(selectedPreferredQualification);
    print(selectedPreferredReligion);
    print(selectedPreferredSmokingHabit);
    super.initState();
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
        title: const Text('Partners Preferences Details'),
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
                  EditProfileDropdown(
                    label: "Preferred Age Range",
                    items: [
                      "18-30",
                      "25-35",
                      "30-40",
                      "35-45",
                      "40-50",
                      "45-55",
                      "50-60",
                      "55-65"
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredAgeRange = value;
                      });
                    },
                    selectedValue: selectedPreferredAgeRange,
                  ),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: "Preferred Religion",
                    items: widget.dropdownModel.religions!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredReligion = value;
                      });
                    },
                    selectedValue: selectedPreferredReligion,
                  ),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: "Preferred Smoking habit",
                    items: ["Yes", "No", "Occasionally", "Any"],
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredSmokingHabit = value;
                      });
                    },
                    selectedValue: selectedPreferredSmokingHabit,
                  ),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: "Preferred Food Preference",
                    items: ["Vegetarian", "Non Vegetarian", "Vegan", "Any"],
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredFood = value;
                      });
                    },
                    selectedValue: selectedPreferredFood,
                  ),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: "Preferred Height Range",
                    items: [
                      '4\'0" - 4\'6" (121-137 cm)',
                      '4\'6" - 4\'10" (137-147 cm)',
                      '4\'10" - 5\'3" (147-160 cm)',
                      '5\'3" - 5\'8" (160-173 cm)',
                      '5\'8" - 6\'1" (173-185 cm)',
                      '6\'1" - 6\'6" (185-198 cm)',
                      '6\'6" - 7\'0" (198-213 cm)'
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredHeightRange = value;
                      });
                    },
                    selectedValue: selectedPreferredHeightRange,
                  ),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: "Preferred Caste",
                    items: widget.dropdownModel.castes!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredCaste = value;
                      });
                    },
                    selectedValue: selectedPreferredCaste,
                  ),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: "Preferred Drinking Habits",
                    items: ["Yes", "No", "Occasionally", "Any"],
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredDrinkingHabit = value;
                      });
                    },
                    selectedValue: selectedPreferredDrinkingHabit,
                  ),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: "Preferred Qualifications",
                    items: widget.dropdownModel.highestEducations!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPreferredQualification = value;
                      });
                    },
                    selectedValue: selectedPreferredQualification,
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
                                .updatePreferencenDetails(
                                    preferredAgeRange:
                                        selectedPreferredAgeRange ?? "",
                                    preferredReligion:
                                        widget.dropdownModel.religions!.firstWhere((religion) => religion.name == selectedPreferredReligion).id ??
                                            "",
                                    preferredSmokingHabits: formatBackToKey(
                                        selectedPreferredSmokingHabit ?? ""),
                                    preferredFoodPreferences: formatBackToKey(
                                        selectedPreferredFood ?? ""),
                                    preferredHeightRange: formatToKey(
                                        selectedPreferredHeightRange ?? ""),
                                    preferredCaste: widget.dropdownModel.castes!.firstWhere((caste) => caste.name == selectedPreferredCaste).id ??
                                        "",
                                    preferredDrinkingHabits: formatBackToKey(
                                        selectedPreferredDrinkingHabit ?? ""),
                                    preferredQualification: widget
                                            .dropdownModel.highestEducations!
                                            .firstWhere((Qualifications) =>
                                                Qualifications.name == selectedPreferredQualification)
                                            .id ??
                                        "",
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
