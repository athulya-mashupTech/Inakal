import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/model/qualification_options_model.dart'
    as qualif;
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class EducationalDetails extends StatefulWidget {
  final DropdownModel dropdownModel;
  final bool isExpanded;
  final void Function() onTap;
  const EducationalDetails(this.dropdownModel,
      {super.key, required this.isExpanded, required this.onTap});

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
  String errorText = "";

  List<String> annualIncomeValues = [
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
  ];

  qualif.QualificationOptionsModel qualificationOptionsModel =
      qualif.QualificationOptionsModel();

  // Label to Value convertion function | Eg: 1 Lakh - 3 Lakhs =>  1-3
  String formatSalaryRange(String input) {
    input = input
        .replaceAll('Crores', '00 Lakhs')
        .replaceAll('Crore', '00 Lakhs')
        .replaceAll('Lakhs', '')
        .replaceAll('Lakh', '')
        .replaceAll('More than ', '')
        .trim();

    List<String> parts = input.split(' - ').map((e) => e.trim()).toList();

    // Handle "More than Crore"
    if (input.contains('00')) {
      double croreValue = double.tryParse(parts[0]) ?? 0;
      return '${(croreValue * 100).toInt()}+';
    }

    // Handle "More than X Lakhs"
    if (!input.contains('-') && parts.length == 1) {
      double value = double.tryParse(parts[0]) ?? 0;
      return '${value.toInt()}+';
    }

    double from = double.tryParse(parts[0]) ?? 0;
    double to = double.tryParse(parts[1]) ?? 0;
    return '${from.toInt()}-${to.toInt()}';
  }

  // Value to label Convertion function | Eg: 1-3 => 1 Lakh - 3 Lakhs
  String reverseFormatSalaryRange(String formatted) {
    if (formatted.contains('+')) {
      int value = int.tryParse(formatted.replaceAll('+', '').trim()) ?? 0;
      if (value >= 200) {
        return 'More than 2 Crore';
      } else {
        return 'More than $value Lakhs';
      }
    }

    List<String> parts = formatted.split('-').map((e) => e.trim()).toList();
    if (parts.length != 2) return formatted;

    int from = int.tryParse(parts[0]) ?? 0;
    int to = int.tryParse(parts[1]) ?? 0;

    String fromLabel = from == 1 ? 'Lakh' : 'Lakhs';
    String toLabel;

    if (to >= 100 && to % 100 == 0) {
      toLabel = 'Crores';
      to = (to / 100).toInt();
    } else {
      toLabel = to == 1 ? 'Lakh' : 'Lakhs';
    }

    if (from >= 100 && from % 100 == 0) {
      from = (from / 100).toInt();
      fromLabel = 'Crore${from > 1 ? 's' : ''}';
    }

    return '$from $fromLabel - $to $toLabel';
  }

  @override
  void initState() {
    getQualifications(
        userController.userData.value.user?.highestEducation ?? "");
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
    selectedIncome = reverseFormatSalaryRange(
        userController.userData.value.user?.annualIncome ?? "");
    super.initState();
  }

  Future<void> getQualifications(String education_id) async {
    await EditProfileService()
        .getQualificationOptions(education_id, context)
        .then((value) {
      setState(() {
        qualificationOptionsModel = value;
      });
    });
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
        key: Key('educational_details_${widget.isExpanded}'),
        initiallyExpanded: widget.isExpanded,
        onExpansionChanged: (expanded) {
          if (expanded && !widget.isExpanded) {
            widget.onTap();
          } else if (!expanded && widget.isExpanded) {
            widget.onTap();
          }
        },
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
                    onChanged: (value) async {
                      setState(() {
                        selectedQualification = null;
                      });
                      await getQualifications(widget
                              .dropdownModel.highestEducations!
                              .firstWhere(
                                  (education) => education.name == value,
                                  orElse: () => ReEdOcLanSt(id: ""))
                              .id ??
                          "");
                      setState(() {
                        selectedHighestEducation = value;
                      });
                    },
                    errorText: selectedHighestEducation == "" ? errorText : null,
                    selectedValue: selectedHighestEducation,
                  ),
                  const SizedBox(height: 16),

                  //Qualification
                  EditProfileDropdown(
                    label: 'Qualification',
                    items: qualificationOptionsModel.qualifications
                            ?.map((item) => item.name ?? "")
                            .toList() ??
                        [],
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
                    errorText: selectedOccupation == "" ? errorText : null,
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
                    items: annualIncomeValues,
                    onChanged: (value) {
                      setState(() {
                        selectedIncome = value;
                      });
                    },
                    selectedValue: annualIncomeValues.contains(selectedIncome)
                        ? selectedIncome
                        : "",
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
                            print("kk " +
                                formatSalaryRange(selectedIncome ?? ""));
                            setState(() {
                              isSaving = true;
                            });
                            await EditProfileService()
                                .updateEducationAndProfessionalDetails(
                                    highestEducation: widget
                                            .dropdownModel.highestEducations!
                                            .firstWhere((edu) => edu.name == selectedHighestEducation,
                                                orElse: () =>
                                                    ReEdOcLanSt(id: ""))
                                            .id ??
                                        "",
                                    qualification: (qualificationOptionsModel
                                            .qualifications ?? [])
                                            .firstWhere((qualification) => qualification.name == selectedQualification,
                                                orElse: () =>
                                                    qualif.Qualifications())
                                            .id ??
                                        "",
                                    occupation: widget
                                            .dropdownModel.occupations!
                                            .firstWhere(
                                                (occupation) => occupation.name == selectedOccupation,
                                                orElse: () => ReEdOcLanSt(id: ""))
                                            .id ??
                                        "",
                                    occupationDetails: occupationDetailsController.text,
                                    workLocation: worklocationController.text,
                                    educationalDetails: educationController.text,
                                    annualIncome: selectedIncome == "" ? "" : formatSalaryRange(selectedIncome ?? ""),
                                    context: context)
                                .then((value) async {
                              if (value != null &&
                                  value.type == "danger" &&
                                  value.message ==
                                      "Highest Education and Occupation are required fields") {
                                setState(() {
                                  errorText = "is a required field!";
                                });
                              }
                              setState(() {
                                isSaving = false;
                              });
                              await EditProfileService()
                                  .updateUserData(context: context);
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
