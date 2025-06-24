import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class EducationalDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  EducationalDetails(this.dropdownModel, {super.key});

  @override
  State<EducationalDetails> createState() => _EducationalDetailsState();
}

class _EducationalDetailsState extends State<EducationalDetails> {
  
  final TextEditingController educationController = TextEditingController();
  final TextEditingController occupationDetailsController = TextEditingController();
  final TextEditingController worklocationController = TextEditingController();
  String? selectedQualification;
  String? selectedGraduate;
  String? selectedOccupation;
  String? selectedIncome;

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
                        selectedGraduate = value;
                      });
                    },
                    selectedValue: selectedGraduate,
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
                    items: widget.dropdownModel.occupations!
                        .map((item) => item.name ?? "")
                        .toList(),
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
