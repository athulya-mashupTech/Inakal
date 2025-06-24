import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class FamilyDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  FamilyDetails(this.dropdownModel, {super.key});

  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  final TextEditingController fatheroccupationController =
      TextEditingController();
  final TextEditingController motheroccupationController =
      TextEditingController();
  final TextEditingController numberofsiblingController =
      TextEditingController();
  final TextEditingController siblingmaritalstatusController =
      TextEditingController();
  String? selectedFamilyType;
  String? selectedFamilyStatus;

  @override
  void dispose() {
    fatheroccupationController.dispose();
    motheroccupationController.dispose();
    numberofsiblingController.dispose();
    siblingmaritalstatusController.dispose();
    siblingmaritalstatusController.dispose();
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
        title: const Text('Family Details'),
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
                  //Family Type Status
                  EditProfileDropdown(
                    label: 'Family Type',
                    items: widget.dropdownModel.religions!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFamilyType = value;
                      });
                    },
                    selectedValue: selectedFamilyType,
                  ),
                  const SizedBox(height: 16),

                  //Family Status feild
                  EditProfileDropdown(
                    label: 'Family Status',
                    items: widget.dropdownModel.castes!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFamilyStatus = value;
                      });
                    },
                    selectedValue: selectedFamilyStatus,
                  ),
                  const SizedBox(height: 16),
                  EditProfileTextFeild(
                      label: 'Fathers Occupation',
                      controller: fatheroccupationController),
                  const SizedBox(height: 16),
                  EditProfileTextFeild(
                      label: 'Mothers Occupation',
                      controller: motheroccupationController),
                  const SizedBox(height: 16),
                  EditProfileTextFeild(
                      label: 'Number of Siblings',
                      controller: numberofsiblingController),
                  const SizedBox(height: 16),
                  EditProfileTextFeild(
                      label: 'Sibling Marital Status',
                      controller: siblingmaritalstatusController),
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
