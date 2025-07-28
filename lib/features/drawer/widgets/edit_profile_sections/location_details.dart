import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/model/districts_search_model.dart' as dsm;
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_dropdown.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_profile_text_feild.dart';

class LocationDetails extends StatefulWidget {
  final DropdownModel dropdownModel;
  final bool isExpanded;
  final void Function() onTap;

  const LocationDetails(
    this.dropdownModel, {
    super.key,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final userController = Get.find<UserDataController>();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final pincodeController = TextEditingController();

  String? selectedDistrictId;
  String? selectedDistrictsStateId;
  String? selectedDistrictName;
  String? selectedState;
  bool isEditing = false;
  bool isSaving = false;

  dsm.DistrictsSearchModel districtsOptionsModel = dsm.DistrictsSearchModel();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final user = userController.userData.value.user;

    addressController.text = user?.address ?? "";
    cityController.text = user?.currentCity ?? "";
    countryController.text = user?.country ?? "";
    pincodeController.text = user?.zipCode ?? "";

    final userDistrict = widget.dropdownModel.districts?.firstWhere(
      (d) => d.id == user?.district,
      orElse: () => Districts(name: ""),
    );

    selectedDistrictName = userDistrict?.name ?? "";
    selectedDistrictId = userDistrict?.id ?? "";
    selectedDistrictsStateId = userDistrict?.stateId ?? "";

    selectedState = widget.dropdownModel.states
            ?.firstWhere(
              (s) => s.id == user?.state,
              orElse: () => ReEdOcLanSt(name: ""),
            )
            .name ??
        "";
  }

  Future<List<String>> _getSearchedDistricts(String query) async {
    if (query.isEmpty) return [];

    try {
      final value = await EditProfileService().getDistricts(query);
      setState(() => districtsOptionsModel = value);

      return (value.districts ?? [])
          .map((d) => d.name ?? "")
          .where((n) => n.isNotEmpty)
          .toList();
    } catch (e) {
      print('Error fetching districts: $e');
      return [];
    }
  }

  void _onDistrictSelected(String selection) {
    print('Selected: $selection');

    final existingIndex = widget.dropdownModel.districts
            ?.indexWhere((d) => d.name == selection) ??
        -1;

    if (existingIndex != -1) {
      final district = widget.dropdownModel.districts![existingIndex];

      setState(() {
        selectedDistrictName = district.name ?? "";
        selectedDistrictId = district.id ?? "";
        selectedDistrictsStateId = district.stateId ?? "";
        selectedState = widget.dropdownModel.states
                ?.firstWhere(
                  (s) => s.id == district.stateId,
                  orElse: () => ReEdOcLanSt(name: ""),
                )
                .name ??
            "";
      });
    } else {
      final district = districtsOptionsModel.districts?.firstWhere(
            (d) => d.name == selection,
            orElse: () => dsm.Districts(id: "", name: ""),
          ) ??
          dsm.Districts(id: "", name: "");

      setState(() {
        selectedDistrictName = district.name ?? "";
        selectedDistrictId = district.id ?? "";
        selectedDistrictsStateId = district.stateId ?? "";
        selectedState = widget.dropdownModel.states
                ?.firstWhere(
                  (s) => s.id == district.stateId,
                  orElse: () => ReEdOcLanSt(name: ""),
                )
                .name ??
            "";
      });
    }

    print('Selected id: $selectedDistrictId');
  }

  Future<bool> _validateDistrict(String input) async {
    if (input.isEmpty) return true;
    try {
      final districts = await _getSearchedDistricts(input);
      return districts.any((d) => d.toLowerCase() == input.toLowerCase());
    } catch (e) {
      return false;
    }
  }

  String? _getStateIdByName(String? stateName) {
    if (stateName == null || stateName.isEmpty) return "";
    return widget.dropdownModel.states
            ?.firstWhere(
              (s) => s.name == stateName,
              orElse: () => ReEdOcLanSt(id: ""),
            )
            .id ??
        "";
  }

  Future<void> _handleFieldLostFocus(
      TextEditingController textEditingController) async {
    final input = textEditingController.text.trim();
    if (input.isNotEmpty) {
      final isValid = await _validateDistrict(input);
      if (!isValid) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Please select a valid district from the suggestions'),
              backgroundColor: AppColors.primaryRed,
            ),
          );
        }
        textEditingController.text = selectedDistrictName ?? '';
      } else {
        _onDistrictSelected(input);
      }
    } else {
      textEditingController.text = selectedDistrictName ?? '';
    }

    setState(() {
      isEditing = false;
    });
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
        key: Key('location_details_${widget.isExpanded}'),
        initiallyExpanded: widget.isExpanded,
        onExpansionChanged: (expanded) {
          if (expanded != widget.isExpanded) widget.onTap();
        },
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
        title: const Text('Location Details'),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditProfileTextFeild(
                  label: 'Address',
                  controller: addressController,
                  maxlines: 3,
                ),
                const SizedBox(height: 16),
                Autocomplete<String>(
                  initialValue:
                      TextEditingValue(text: selectedDistrictName ?? ''),
                  optionsBuilder: (textEditingValue) async {
                    if (textEditingValue.text.isEmpty) {
                      return widget.dropdownModel.districts
                              ?.map((d) => d.name ?? "") ??
                          [];
                    }
                    final result =
                        await _getSearchedDistricts(textEditingValue.text);
                    return result.where((d) => d
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()));
                  },
                  onSelected: (selection) {
                    _onDistrictSelected(selection);
                    setState(() => isEditing = false);
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return Focus(
                      onFocusChange: (hasFocus) {
                        if (!hasFocus && isEditing) {
                          _handleFieldLostFocus(textEditingController);
                        }
                      },
                      child: TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onChanged: (_) {
                          if (!isEditing) {
                            setState(() => isEditing = true);
                          }
                        },
                        onFieldSubmitted: (_) =>
                            _handleFieldLostFocus(textEditingController),
                        decoration: InputDecoration(
                          labelText: "Select District",
                          fillColor: AppColors.white,
                          labelStyle: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: AppColors.primaryRed),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                EditProfileDropdown(
                  label: "State",
                  items: widget.dropdownModel.states
                          ?.map((item) => item.name ?? "")
                          .toList() ??
                      [],
                  onChanged: (value) {
                    setState(() {
                      selectedState = value;
                    });
                  },
                  selectedValue: selectedState,
                ),
                const SizedBox(height: 16),
                EditProfileTextFeild(
                    label: 'Country', controller: countryController),
                const SizedBox(height: 16),
                EditProfileTextFeild(
                  label: 'Pincode',
                  controller: pincodeController,
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                isSaving
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryRed,
                        ),
                      )
                    : CustomButton(
                        text: "Save Changes",
                        onPressed: () async {
                          setState(() => isSaving = true);

                          print(selectedDistrictId);
                          print(_getStateIdByName(selectedState));

                          if (selectedDistrictsStateId ==
                              _getStateIdByName(selectedState)) {
                            await EditProfileService()
                                .updateLocationDetails(
                              address: addressController.text,
                              city: cityController.text,
                              district: selectedDistrictId ?? "",
                              state: _getStateIdByName(selectedState) ?? "",
                              country: countryController.text,
                              zipcode: pincodeController.text,
                              context: context,
                            )
                                .then((value) async {
                              print("Result: ${value?.message}");
                              setState(() => isSaving = false);
                              await EditProfileService()
                                  .updateUserData(context: context);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please select a valid district matching the state'),
                                backgroundColor: AppColors.primaryRed,
                              ),
                            );
                            setState(() => isSaving = false);
                          }
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
