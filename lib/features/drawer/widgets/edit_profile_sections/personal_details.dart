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

class PersonalDetails extends StatefulWidget {
    DropdownModel dropdownModel;

  PersonalDetails(this.dropdownModel, {super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final userController = Get.find<UserDataController>();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController starController = TextEditingController();
  String? selectedReligion;
  String? selectedCaste;
  String? selectedSubCaste;
  String? selectedmaritalStatus;
  String? selectedmotherTongue;
  List<String> languages = ["Malayalam", "English"];

  String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

  @override
  void initState() { 
    heightController.text = userController.userData.value.user?.height ?? "";
    weightController.text = userController.userData.value.user?.weight ?? "";
    starController.text = userController.userData.value.user?.starSign ?? "";
    selectedReligion = widget.dropdownModel.religions!.firstWhere((religion) => religion.id == userController.userData.value.user?.religion).name ?? "";
    selectedCaste = widget.dropdownModel.castes!.firstWhere((caste) => caste.id == userController.userData.value.user?.caste).name ?? "";
    selectedSubCaste = widget.dropdownModel.subcastes!.firstWhere((subcaste) => subcaste.id == userController.userData.value.user?.subCaste).name ?? "";
    selectedmaritalStatus = capitalizeFirstLetter(userController.userData.value.user?.maritalStatus ?? "");
    selectedmotherTongue = widget.dropdownModel.languages!.firstWhere((languages) => languages.id == userController.userData.value.user?.motherTongue).name ?? "";
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
                  //height feild

                  //weight feild

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
                    items: [
                      "Single",
                      "Married",
                      "Divorced",
                      "Widowed",
                      "Widow"
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedmaritalStatus = value;
                      });
                    },
                    selectedValue: selectedmaritalStatus,
                  ),
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
                   CustomButton(
                    text: "Save Changes",
                    // onPressed: () async {
                    //   await EditProfileService()
                    //       .updatePersonalDetails(
                    //           // firstName: firstNameController.text,
                    //           // lastName: lastNameController.text,
                    //           // email: emailController.text,
                    //           // countryCode: _countryCode,
                    //           // phoneNumber: _phoneNumber,
                    //           // dob: dateOfBirthController.text,
                    //           // gender: selectedGender ?? "",
                    //           context: context)
                    //       .then((value) {
                    //     if (value!.type == "success") {
                    //       updateProfileDetails();
                    //     }
                    //   });
                    // },
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
