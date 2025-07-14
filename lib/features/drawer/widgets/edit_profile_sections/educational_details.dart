import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class EducationalDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  EducationalDetails(this.dropdownModel, {super.key});

  @override
  State<EducationalDetails> createState() => _EducationalDetailsState();
}

class _EducationalDetailsState extends State<EducationalDetails> {
  final userController = Get.find<UserDataController>();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController occupationDetailsController =
      TextEditingController();
  final TextEditingController worklocationController = TextEditingController();
  String? selectedQualification;
  String? selectedHighestEducation;
  String? selectedOccupation;
  String? selectedIncome;

  bool isSaving = false;
  String formatSalaryRange(String input) {
    input =
        input.replaceAll('Crores', '00 Lakhs').replaceAll('Crore', '00 Lakhs');
    List<String> parts = input
        .replaceAll('Lakhs', '')
        .replaceAll('Lakh', '')
        .replaceAll('More than ', '')
        .split(' - ')
        .map((e) => e.trim())
        .toList();

    if (input.contains('More than')) {
      double value = double.tryParse(parts[0]) ?? 0;
      return '${value.toInt()}+';
    }

    double from = double.tryParse(parts[0]) ?? 0;
    double to = double.tryParse(parts[1]) ?? 0;

    return '${from.toInt()}-${to.toInt()}';
  }

  @override
  void initState() {
    educationController.text =
        userController.userData.value.user?.educationDetails ?? "";
    occupationDetailsController.text =
        userController.userData.value.user?.occupationDetails ?? "";
    worklocationController.text =
        userController.userData.value.user?.workLocation ?? "";
    selectedQualification = widget.dropdownModel.qualifications!
            .firstWhere(
              (qualifications) =>
                  qualifications.id ==
                  userController.userData.value.user?.qualification,
              orElse: () => Qualifications(name: ""),
            )
            .name ??
        "";
    selectedHighestEducation = widget.dropdownModel.highestEducations!
            .firstWhere(
              (highesteducation) =>
                  highesteducation.id ==
                  userController.userData.value.user?.highestEducation,
              orElse: () => ReEdOcLanSt(name: ""),
            )
            .name ??
        "";
    selectedOccupation = widget.dropdownModel.occupations!
            .firstWhere(
              (occupation) =>
                  occupation.id ==
                  userController.userData.value.user?.occupation,
              orElse: () => ReEdOcLanSt(name: ""),
            )
            .name ??
        "";
    selectedIncome = userController.userData.value.user?.annualIncome ?? "";
    super.initState();
  }

  @override
  void dispose() {
    educationController.dispose();
    occupationDetailsController.dispose();
    worklocationController.dispose();
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
        title: const Text('Educational & Professional Details'),
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
                  // Highest Education
                  EditProfileDropdown(
                    label: 'Highest Education',
                    items: widget.dropdownModel.highestEducations!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedHighestEducation = value;
                      });
                    },
                    selectedValue: selectedHighestEducation,
                  ),
                  const SizedBox(height: 16),

                  //Qualification
                  EditProfileDropdown(
                    label: 'Qualification',
                    items: widget.dropdownModel.qualifications!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedQualification = value;
                      });
                    },
                    selectedValue: selectedQualification,
                  ),
                  const SizedBox(height: 16),

                  //Education Details
                  EditProfileTextFeild(
                      label: 'Education Details',
                      controller: educationController),
                  const SizedBox(height: 16),

                  //Occupation
                  EditProfileDropdown(
                    label: 'Occupation',
                    items: widget.dropdownModel.occupations!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOccupation = value;
                      });
                    },
                    selectedValue: selectedOccupation,
                  ),
                  const SizedBox(height: 16),

                  //Occupation Details
                  EditProfileTextFeild(
                      label: 'Occupation Details',
                      controller: occupationDetailsController),
                  const SizedBox(height: 16),

                  //Annual Income
                  EditProfileDropdown(
                    label: 'Annual Income',
                    items: [
                      "1 Lakh - 3 Lakhs",
                      "3 Lakhs -5 Lakhs",
                      "5 Lakhs - 7 Lakhs",
                      "7 Lakhs - 10 Lakhs",
                      "10 Lakhs - 15 Lakhs",
                      "15 Lakhs - 20 Lakhs",
                      "20 Lakhs - 30 Lakhs",
                      "30 Lakhs - 50 Lakhs",
                      "50 Lakhs - 75 Lakhs",
                      "75 Lakhs - 1 Crores",
                      "1 Crore - 2 Crores",
                      "More than 2 Crore"
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedIncome = value;
                      });
                    },
                    selectedValue: selectedIncome,
                  ),
                  const SizedBox(height: 16),

                  //Work Location
                  EditProfileTextFeild(
                      label: 'Work Location',
                      controller: worklocationController),
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
                            print("kk "+formatSalaryRange(selectedIncome ?? ""));
                            setState(() {
                              isSaving = true;
                            });
                            await EditProfileService()
                                .updateEducationAndProfessionalDetails(
                                    highestEducation: widget
                                            .dropdownModel.highestEducations!
                                            .firstWhere((edu) =>
                                                edu.name ==
                                                selectedHighestEducation)
                                            .id ??
                                        "",
                                    qualification: widget
                                            .dropdownModel.qualifications!
                                            .firstWhere((qualification) =>
                                                qualification.name ==
                                                selectedQualification)
                                            .id ??
                                        "",
                                    occupation: widget
                                            .dropdownModel.occupations!
                                            .firstWhere((occupation) =>
                                                occupation.name ==
                                                selectedOccupation)
                                            .id ??
                                        "",
                                    occupationDetails:
                                        occupationDetailsController.text,
                                    workLocation: worklocationController.text,
                                    educationalDetails:
                                        educationController.text,
                                    annualIncome: selectedIncome == "" ? "" : formatSalaryRange(selectedIncome ?? ""),
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
