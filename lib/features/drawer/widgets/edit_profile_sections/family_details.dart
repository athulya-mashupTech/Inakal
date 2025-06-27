import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class FamilyDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  FamilyDetails(this.dropdownModel, {super.key});

  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  final userController = Get.find<UserDataController>();
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

  bool isSaving = false;

  String formatLabel(String value) {
    return value
        .split('_') // Split by underscores
        .map((word) => word.isNotEmpty
            ? word[0].toUpperCase() + word.substring(1).toLowerCase()
            : '')
        .join(' '); // Join with space
  }

  String formatBackToKey(String value) {
    return value
        .trim() // Remove leading/trailing spaces
        .toLowerCase() // Convert entire string to lowercase
        .replaceAll(' ', '_'); // Replace spaces with underscores
  }

  @override
  void initState() {
    fatheroccupationController.text =
        userController.userData.value.user?.fathersOccupation ?? "";
    motheroccupationController.text =
        userController.userData.value.user?.mothersOccupation ?? "";
    numberofsiblingController.text =
        userController.userData.value.user?.numberOfSiblings ?? "";
    siblingmaritalstatusController.text =
        userController.userData.value.user?.siblingsMaritalStatus ?? "";
    selectedFamilyType =
        formatLabel(userController.userData.value.user?.familyType ?? "");
    selectedFamilyStatus =
        formatLabel(userController.userData.value.user?.familyStatus ?? "");
    super.initState();
  }

  @override
  void dispose() {
    fatheroccupationController.dispose();
    motheroccupationController.dispose();
    numberofsiblingController.dispose();
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
                    items: ["Joint", "Nuclear"],
                    onChanged: (value) {
                      setState(() {
                        selectedFamilyType = value;
                      });
                    },
                    selectedValue: selectedFamilyType,
                  ),
                  const SizedBox(height: 16),

                  //Family Status feild
                  // EditProfileDropdown(
                  //   label: 'Family Status',
                  //   items: ["Upper Class", "Middle Class", "Lower Class"],
                  //   onChanged: (value) {
                  //     setState(() {
                  //       selectedFamilyStatus = value;
                  //     });
                  //   },
                  //   selectedValue: selectedFamilyStatus,
                  // ),
                  // const SizedBox(height: 16),
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
                      inputType: TextInputType.number,
                      controller: numberofsiblingController),
                  const SizedBox(height: 16),
                  EditProfileTextFeild(
                      label: 'Sibling Marital Status',
                      maxlines: 3,
                      controller: siblingmaritalstatusController),
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
                                .updateFamilyDetails(
                                    familyType: formatBackToKey(
                                        selectedFamilyType ?? ""),
                                    mothersOccupation:
                                        motheroccupationController.text,
                                    fathersOccupation:
                                        fatheroccupationController.text,
                                    numberOfSiblings:
                                        numberofsiblingController.text,
                                    siblingsMaritalStatus:
                                        siblingmaritalstatusController.text,
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
