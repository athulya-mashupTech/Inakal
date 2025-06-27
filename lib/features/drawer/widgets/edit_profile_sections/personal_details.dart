import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/common/add_hobbie_widget.dart';
import 'package:inakal/features/drawer/widgets/common/option_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PersonalDetails extends StatefulWidget {
  DropdownModel dropdownModel;

  PersonalDetails(this.dropdownModel, {super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final userController = Get.find<UserDataController>();
  final TextEditingController secondaryPhNoController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController otherCasteSubCasteController =
      TextEditingController();
  final TextEditingController starController = TextEditingController();
  final TextEditingController noOfChildrenController = TextEditingController();
  String? selectedReligion;
  String? selectedCaste;
  String? selectedSubCaste;
  String? selectedmaritalStatus;
  String? selectedmotherTongue;
  List<String> languages = ["Malayalam", "English"];
  List<String> maritalStatus = ["Single", "Divorced", "Widowed", "Widow"];

  bool isSaving = false;

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
    secondaryPhNoController.text =
        userController.userData.value.user?.secondaryNumber ?? "";
    heightController.text = userController.userData.value.user?.height ?? "";
    weightController.text = userController.userData.value.user?.weight ?? "";
    starController.text = userController.userData.value.user?.starSign ?? "";
    noOfChildrenController.text =
        userController.userData.value.user?.numberOfChildren ?? "";
    selectedReligion = widget.dropdownModel.religions!
            .firstWhere((religion) =>
                religion.id == userController.userData.value.user?.religion)
            .name ??
        "";
    selectedCaste = widget.dropdownModel.castes!
            .firstWhere((caste) =>
                caste.id == userController.userData.value.user?.caste)
            .name ??
        "";
    selectedSubCaste = widget.dropdownModel.subcastes!
            .firstWhere((subcaste) =>
                subcaste.id == userController.userData.value.user?.subCaste)
            .name ??
        "";
    selectedmaritalStatus =
        formatLabel(userController.userData.value.user?.maritalStatus ?? "");
    selectedmotherTongue = widget.dropdownModel.languages!
            .firstWhere((languages) =>
                languages.id ==
                userController.userData.value.user?.motherTongue)
            .name ??
        "";
    super.initState();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    starController.dispose();
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
        title: const Text('Personal Details'),
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
                  IntlPhoneField(
                    controller: secondaryPhNoController,
                    decoration: InputDecoration(
                      labelText: 'Secondary Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        print("Sec No: ${secondaryPhNoController.text}");
                      });
                    },
                    initialCountryCode: 'IN',
                  ),
                  const SizedBox(height: 16),

                  // height feild
                  EditProfileTextFeild(
                      label: 'Height (cm)', controller: heightController),
                  const SizedBox(height: 16),

                  //weight feild
                  EditProfileTextFeild(
                      label: 'Weight (kg)', controller: weightController),
                  const SizedBox(height: 16),

                  //religion feild
                  EditProfileDropdown(
                    label: 'Religion',
                    items: widget.dropdownModel.religions!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedReligion = value;
                      });
                    },
                    selectedValue: selectedReligion,
                  ),
                  const SizedBox(height: 16),

                  //Caste feild
                  EditProfileDropdown(
                    label: 'Caste',
                    items: widget.dropdownModel.castes!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCaste = value;
                      });
                    },
                    selectedValue: selectedCaste,
                  ),
                  const SizedBox(height: 16),

                  // Other Caste/Sub Caste feild
                  EditProfileTextFeild(
                      label: 'Other Caste/Sub Caste (Specify if any)',
                      controller: otherCasteSubCasteController),
                  const SizedBox(height: 16),

                  //Subcaste feild
                  EditProfileDropdown(
                    label: 'Sub Caste',
                    items: widget.dropdownModel.subcastes!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSubCaste = value;
                      });
                    },
                    selectedValue: selectedSubCaste,
                  ),
                  const SizedBox(height: 16),

                  //star sign feild
                  EditProfileTextFeild(
                      label: 'Star Sign', controller: starController),
                  const SizedBox(height: 16),

                  //mother tongue feild
                  EditProfileDropdown(
                    label: 'Mother Tongue',
                    items: widget.dropdownModel.languages!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedmotherTongue = value;
                      });
                    },
                    selectedValue: selectedmotherTongue,
                  ),
                  const SizedBox(height: 16),

                  //marital status feild
                  EditProfileDropdown(
                    label: 'Marital Status',
                    items: maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        selectedmaritalStatus = value;
                      });
                    },
                    selectedValue: selectedmaritalStatus,
                  ),

                  const SizedBox(height: 16),

                  // Number of Children TextField
                  if (selectedmaritalStatus != "Single")
                    EditProfileTextFeild(
                        label: 'Number of children',
                        controller: noOfChildrenController,
                        inputType: TextInputType.number),
                  const SizedBox(height: 16),

                  //languages known
                  Text("Languages Known",
                      style: TextStyle(color: AppColors.grey, fontSize: 14)),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: [
                      ...languages.map((language) {
                        return OptionWidget(
                          label: language,
                          icon: Icons.close,
                          onPressed: () {
                            setState(() {
                              languages.remove(language);
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
                                title: Text("Add Language"),
                                content: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    hintText: "Enter your language",
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
                              languages.add(newLanguage);
                            });
                          }
                        }, // Can be empty since the outer GestureDetector handles it
                      )
                    ],
                  ),
                  SizedBox(height: 16),
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
                                .updatePersonalDetails(
                                    secondarynumber:
                                        secondaryPhNoController.text,
                                    height: heightController.text,
                                    weight: weightController.text,
                                    religion: widget.dropdownModel.religions!
                                            .firstWhere((religion) =>
                                                selectedReligion ==
                                                religion.name)
                                            .id ??
                                        "",
                                    caste: widget.dropdownModel.castes!
                                            .firstWhere((caste) =>
                                                selectedCaste == caste.name)
                                            .id ??
                                        "",
                                    other_caste_subcaste:
                                        otherCasteSubCasteController.text,
                                    sub_caste: widget.dropdownModel.subcastes!
                                            .firstWhere((subCaste) =>
                                                selectedSubCaste == subCaste.name)
                                            .id ??
                                        "",
                                    star_sign: formatBackToKey(starController.text),
                                    mother_tongue: widget.dropdownModel.languages!.firstWhere((lang) => selectedmotherTongue == lang.name).id ?? "",
                                    marital_status: formatBackToKey(selectedmaritalStatus ?? ""),
                                    number_of_children: selectedmaritalStatus == "Single" ? "0" : noOfChildrenController.text,
                                    languagesKnown: languages.join(","),
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
