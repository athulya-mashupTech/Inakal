import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class LocationDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  LocationDetails(this.dropdownModel, {super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final userController = Get.find<UserDataController>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  String? selectedDistrict;
  String? selectedState;

  @override
  void initState() {
    addressController.text = userController.userData.value.user?.address ?? "";
    cityController.text = userController.userData.value.user?.currentCity ?? "";
    countryController.text = userController.userData.value.user?.country ?? "";
    pincodeController.text = userController.userData.value.user?.zipCode ?? "";
    selectedDistrict = widget.dropdownModel.districts!
            .firstWhere((districts) =>
                districts.id == userController.userData.value.user?.district)
            .name ??
        "";
    selectedState = widget.dropdownModel.states!
            .firstWhere((states) =>
                states.id == userController.userData.value.user?.state)
            .name ??
        "";
    super.initState();
  }

  @override
  void dispose() {
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    pincodeController.dispose();
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
        title: const Text('Location Details'),
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
                  // Address - multiline TextField
                  EditProfileTextFeild(
                    label: 'Address',
                    controller: addressController,
                    maxlines: 3,
                  ),
                  const SizedBox(height: 16),
                  // City - TextField
                  EditProfileTextFeild(
                      label: 'City', controller: cityController),
                  const SizedBox(height: 16),
                  // District - Dropdown
                  EditProfileDropdown(
                    label: "District",
                    items: widget.dropdownModel.districts!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDistrict = value;
                      });
                    },
                    selectedValue: selectedDistrict,
                  ),
                  const SizedBox(height: 16),
                  // State - Dropdown
                  EditProfileDropdown(
                    label: "State",
                    items: widget.dropdownModel.states!
                        .map((item) => item.name ?? "")
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedState = value;
                      });
                    },
                    selectedValue: selectedState,
                  ),
                  const SizedBox(height: 16),
                  // Country - TextField
                  EditProfileTextFeild(
                      label: 'Country', controller: countryController),
                  const SizedBox(height: 16),
                  // Pincode - TextField
                  EditProfileTextFeild(
                      label: 'Pincode',
                      controller: pincodeController,
                      inputType: TextInputType.number),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: "Save Changes",
                    onPressed: () async{
                       await EditProfileService().updateLocationDetails(
                          address: addressController.text,
                          city: cityController.text,
                          district: widget.dropdownModel.districts!.firstWhere((district) => district.name == selectedDistrict).id ?? "",
                          state: widget.dropdownModel.states!.firstWhere((state)=>state.name == selectedState).id ?? "",
                          country: countryController.text,
                          zipcode: pincodeController.text,
                          context: context);
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
