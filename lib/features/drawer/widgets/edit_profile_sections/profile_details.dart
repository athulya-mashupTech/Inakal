import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_date_picker.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileDetails extends StatefulWidget {
  final DropdownModel dropdownModel;
  ProfileDetails(this.dropdownModel, {Key? key}) : super(key: key);

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final userController = Get.find<UserDataController>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  String? selectedGender;
  String _countryCode = '';
  String _phoneNumber = '';

  bool isSaving = false;

  @override
  void initState() {
    firstNameController.text =
        userController.userData.value.user?.firstName ?? "";
    lastNameController.text =
        userController.userData.value.user?.lastName ?? "";
    emailController.text = userController.userData.value.user?.email ?? "";
    phoneNumberController.text =
        userController.userData.value.user?.phone ?? "";
    _phoneNumber = userController.userData.value.user?.phone ?? "";
    _countryCode = "+${userController.userData.value.user?.countryCode}";
    print(_countryCode);
    dateOfBirthController.text = userController.userData.value.user?.dob ?? "";
    selectedGender = userController.userData.value.user?.gender ?? "";
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
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
        title: const Text('Profile Details'),
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
                  EditProfileTextFeild(
                      label: 'First Name', controller: firstNameController),
                  const SizedBox(height: 16),
                  EditProfileTextFeild(
                      label: 'Last Name', controller: lastNameController),
                  const SizedBox(height: 16),
                  EditProfileTextFeild(
                      label: 'Email', controller: emailController),
                  const SizedBox(height: 16),
                  IntlPhoneField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _countryCode = value.countryCode;
                        _phoneNumber = value.number;
                      });
                    },
                    initialCountryCode: 'IN',
                  ),
                  // EditProfileTextFeild(
                  //     label: 'Phone Number', controller: phoneNumberController),
                  const SizedBox(height: 16),
                  EditProfileDatePicker(
                      label: 'Date of Birth',
                      controller: dateOfBirthController),
                  const SizedBox(height: 16),
                  EditProfileDropdown(
                    label: 'Gender',
                    items: ["Male", "Female"],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    selectedValue: selectedGender,
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
                                .updateProfileDetails(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    countryCode: _countryCode,
                                    phoneNumber: _phoneNumber,
                                    dob: dateOfBirthController.text,
                                    gender: selectedGender ?? "",
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
