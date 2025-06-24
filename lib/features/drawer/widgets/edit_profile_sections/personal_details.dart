import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class PersonalDetails extends StatefulWidget {
  DropdownModel dropdownModel;

  PersonalDetails(this.dropdownModel, {super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController castController = TextEditingController();
  final TextEditingController subcasteController = TextEditingController();
  final TextEditingController starController = TextEditingController();
  final TextEditingController mothertongueController = TextEditingController();
  final TextEditingController maritalstatusController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();
  String? selectedReligion;
  String? selectedCaste;
  String? selectedSubCaste;
  String? selectedmaritalStatus;
  String? selectedmotherTongue;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    religionController.dispose();
    castController.dispose();
    subcasteController.dispose();
    starController.dispose();
    mothertongueController.dispose();
    maritalstatusController.dispose();
    languagesController.dispose();
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
