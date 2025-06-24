import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/widgets/dummy_widgets/edit_dropdown_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class LocationDetails extends StatefulWidget {
  DropdownModel dropdownModel;
  LocationDetails(this.dropdownModel, {super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  String? selectedDistrict;
  String? selectedState;

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
                        selectedDistrict = value;
                      });
                    },
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
