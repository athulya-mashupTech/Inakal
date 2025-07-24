import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/model/auth_dropdown_model.dart';
import 'package:inakal/features/auth/model/districts_search_model.dart';
import 'package:inakal/features/auth/registration/screens/registration_description.dart';
import 'package:inakal/features/auth/registration/widgets/dropdown_feild.dart';
import 'package:inakal/features/auth/registration/widgets/registration_loader.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/features/auth/registration/widgets/gender_selection.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/service/auth_service.dart';
import 'package:intl/intl.dart';
import '../widgets/text_field_widget.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  final TextEditingController _noOfChildrenController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? selectedGender;

  List<String> filteredStates = [];
  AuthDropdownModel authDropdownOptions = AuthDropdownModel();

  String selectedStateName = "";
  String selectedDistrictName = "";
  String selectedDistrictsStateId = "";
  TextEditingController districtSearchController = TextEditingController();

  List<String> maritalStatusValues = [
    "Single",
    "Divorced",
    "Widowed",
    "Widower"
  ];
  bool isNoOfChildren = false;

  bool _focusListenerAdded = false;
  DistrictsSearchModel districtsOptionsModel = DistrictsSearchModel();

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _districtController.dispose();
    _pincodeController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _maritalStatusController.dispose();
    _noOfChildrenController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override
  void initState() {
    getAuthOptions();
    _maritalStatusController.addListener(() {
      setState(() {
        print(_maritalStatusController.text);
        isNoOfChildren =
            (maritalStatusValues.contains(_maritalStatusController.text) &&
                _maritalStatusController.text != "Single");
      });
    });
    super.initState();
  }

  var isChecked = false;

  Future<void> getAuthOptions() async {
    final value = await AuthService().getAuthOptions();
    setState(() {
      authDropdownOptions = value;
      filteredStates = (authDropdownOptions.states ?? [])
          .map((state) => state.name ?? "")
          .toList();
    });
  }

  Future<List<String>> _getSearchedDistricts(String query) async {
    if (query.isEmpty) {
      return [];
    }

    try {
      final value = await AuthService().getDistricts(query);
      setState(() {
        districtsOptionsModel = value;
      });
      final items = (value.districts ?? [])
          .map((district) => district.name ?? "")
          .where((name) => name.isNotEmpty)
          .toList();
      return items;
    } catch (e) {
      // Handle error gracefully
      print('Error fetching districts: $e');
      return [];
    }
  }

  void _handleFocusLoss(TextEditingController textEditingController) async {
    final currentText = textEditingController.text.trim();

    if (currentText.isEmpty) {
      // Clear everything when text is empty
      setState(() {
        _districtController.clear();
        selectedDistrictName = "";
        selectedDistrictsStateId = "";
        districtSearchController.clear();
      });
      return;
    }

    // Check if the entered text matches any valid district
    final districts = await _getSearchedDistricts(currentText);
    final isValidDistrict = districts
        .any((district) => district.toLowerCase() == currentText.toLowerCase());

    if (!isValidDistrict) {
      // Clear the text if it doesn't match any valid district
      setState(() {
        _districtController.clear();
        selectedDistrictName = "";
        selectedDistrictsStateId = "";
        districtSearchController.clear();
      });
      textEditingController.clear();
    } else {
      // Update the controllers if it's a valid district
      setState(() {
        districtSearchController.text = currentText;
        // Note: You might need to also update _districtController.text with the district ID here
        // if you can find the matching district from the search results
      });
    }
  }

  final AuthController regController = Get.find();
  void _storeData() {
    regController.setBasicDetails(
        firstName: _firstNameController.text,
        lastName: _secondNameController.text,
        email: _emailController.text,
        address: _addressController.text,
        country: _countryController.text,
        state: _stateController.text,
        district: _districtController.text,
        pincode: _pincodeController.text,
        dob: _dobController.text,
        maritalStatus: _maritalStatusController.text.toLowerCase(),
        noOfChildren: _noOfChildrenController.text == ""
            ? "0"
            : _noOfChildrenController.text,
        gender: selectedGender ?? "");

    print(_firstNameController.text);
    print(_secondNameController.text);
    print(_emailController.text);
    print(_addressController.text);
    print(_countryController.text);
    print(_stateController.text);
    print(_districtController.text);
    print(_pincodeController.text);
    print(_dobController.text);
    print(_maritalStatusController.text.toLowerCase());
    print(_noOfChildrenController.text == ""
        ? "0"
        : _noOfChildrenController.text);
    print(selectedGender ?? "");
  }

  String getHeadingText(String profileFor) {
    switch (profileFor) {
      case "Myself":
        return "Let’s Get to Know You Better!";
      case "Son":
        return "Let’s Get to Know Your Son Better!";
      case "Daughter":
        return "Let’s Get to Know Your Daughter Better!";
      case "Friend":
        return "Let’s Get to Know Your Friend Better!";
      case "Cousin":
        return "Let’s Get to Know Your Cousin Better!";
      case "Brother":
        return "Let’s Get to Know Your Brother Better!";
      case "Sister":
        return "Let’s Get to Know Your Sister Better!";
      default:
        return "Let’s Get to Know You Better!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const RegistrationLoader(progress: 2),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  getHeadingText(regController
                          .user.value.userProfileCreatedFor ??
                      ""), // Replace with the actual profile created for value
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryRed,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFieldWidget(
                controller: _firstNameController,
                hintText: 'First Name',
                validator: (value) =>
                    value!.isEmpty ? 'First Name is required' : null,
              ),
              TextFieldWidget(
                controller: _secondNameController,
                hintText: 'Second Name',
                validator: (value) =>
                    value!.isEmpty ? 'Second Name is required' : null,
              ),
              TextFieldWidget(
                controller: _emailController,
                hintText: 'Email ID',
                validator: _validateEmail,
              ),
              TextFieldWidget(
                controller: _addressController,
                hintText: 'Address',
                validator: (value) =>
                    value!.isEmpty ? 'Address is required' : null,
              ),
              // const SizedBox(height: 10),

              /// Districts Autocomplete
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }

                  // Fetch districts based on the current input
                  final districts =
                      await _getSearchedDistricts(textEditingValue.text);

                  return districts.where((district) => district
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (String selection) {
                  print('Selected: $selection');
                  setState(() {
                    final selectedDistrict =
                        (districtsOptionsModel.districts ?? []).firstWhere(
                      (district) => district.name == selection,
                      orElse: () => Districts(id: "", name: ""),
                    );

                    _districtController.text = selectedDistrict.id ?? "";
                    selectedDistrictsStateId = selectedDistrict.stateId ?? "";
                    print("Distict's State ID" + selectedDistrictsStateId);

                    if (_stateController.text != selectedDistrictsStateId) {
                      setState(() {
                        _stateController.text = (authDropdownOptions.states ??
                                    [])
                                .firstWhere(
                                    (state) =>
                                        state.id == selectedDistrictsStateId,
                                    orElse: () => ReHeOcLangSt(id: ""))
                                .id ??
                            "";
                        selectedStateName = (authDropdownOptions.states ?? [])
                                .firstWhere(
                                    (state) =>
                                        state.id == selectedDistrictsStateId,
                                    orElse: () => ReHeOcLangSt(name: ""))
                                .name ??
                            "";
                      });
                      print(selectedStateName);
                    }
                  });

                  print('Selected id: ${_districtController.text}');
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  // Sync the autocomplete's text controller with our managed controller
                  textEditingController.text = districtSearchController.text;

                  // Add focus listener only once
                  if (!_focusListenerAdded) {
                    focusNode.addListener(() {
                      if (!focusNode.hasFocus) {
                        _handleFocusLoss(textEditingController);
                      }
                    });
                    _focusListenerAdded = true;
                  }

                  // Listen to changes in the autocomplete text controller and sync back
                  textEditingController.addListener(() {
                    if (districtSearchController.text !=
                        textEditingController.text) {
                      districtSearchController.text =
                          textEditingController.text;
                    }
                  });

                  return TextFieldWidget(
                    controller: textEditingController,
                    hintText: "Select District",
                    focusNode: focusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'District is required';
                      }
                      return null;
                    },
                  );
                },
              ),

              /// State Autocomplete
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return filteredStates
                      .where((state) => state.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          ));
                },
                onSelected: (String selection) {
                  print('State selected: $selection');

                  // Get the ID of the newly selected state
                  String newStateId = (authDropdownOptions.states ?? [])
                          .firstWhere((state) => state.name == selection,
                              orElse: () => ReHeOcLangSt(id: ""))
                          .id ??
                      "";

                  // Check if the newly selected state is different from the district's state
                  if (selectedDistrictsStateId.isNotEmpty &&
                      selectedDistrictsStateId != newStateId) {
                    // Clear district-related data when state changes
                    setState(() {
                      selectedStateName = selection;
                      _stateController.text = newStateId;

                      // Clear district data since state changed
                      _districtController.text = "";
                      selectedDistrictName = "";
                      selectedDistrictsStateId = "";

                      // IMPORTANT: Clear the district text controller to update UI
                      districtSearchController.clear();
                    });
                    print('State changed - District data cleared');
                  } else {
                    // Just update state data without clearing district
                    setState(() {
                      selectedStateName = selection;
                      _stateController.text = newStateId;
                    });
                  }

                  print('New state ID: $newStateId');
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  // Set the current selected state name in the text field
                  textEditingController.text = selectedStateName;

                  focusNode.addListener(() {
                    if (!focusNode.hasFocus) {
                      final currentText = textEditingController.text;
                      bool isValidState = filteredStates.any((state) =>
                          state.toLowerCase() == currentText.toLowerCase());

                      if (!isValidState && currentText.isNotEmpty) {
                        textEditingController.clear();
                        setState(() {
                          selectedStateName = "";
                          _stateController.clear();
                          // Also clear district data when state is cleared
                          if (selectedDistrictsStateId.isNotEmpty) {
                            _districtController.text = "";
                            selectedDistrictName = "";
                            selectedDistrictsStateId = "";
                            // IMPORTANT: Clear the district text controller to update UI
                            districtSearchController.clear();
                          }
                        });
                      }
                    }
                  });

                  return TextFieldWidget(
                    controller: textEditingController,
                    hintText: "Select State",
                    focusNode: focusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'State is required';
                      }
                      return null;
                    },
                  );
                },
              ),

              // const SizedBox(height: 10),
              // SearchableStateWidget(
              //     label: "State", valueController: _stateController),
              // const SizedBox(height: 10),

              TextFieldWidget(
                controller: _countryController,
                hintText: 'Specify Country',
                validator: (value) =>
                    value!.isEmpty ? 'Country is required' : null,
              ),
              TextFieldWidget(
                controller: _pincodeController,
                hintText: 'Pincode',
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Pincode is required' : null,
              ),
              const SizedBox(height: 10),
              Center(child: Text("Gender")),
              GenderSelectionWidget(
                selectedGender: selectedGender,
                onGenderSelected: (gender) {
                  setState(() {
                    // If gender is changed after selecting DOB, clear the DOB field
                    if (selectedGender != null &&
                        selectedGender != gender &&
                        _dobController.text.isNotEmpty) {
                      _dobController.clear();
                    }
                    selectedGender = gender;
                  });
                },
              ),
              selectedGender == "error"
                  ? const Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Select a gender",
                          style: TextStyle(
                              color: AppColors.errorRed, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : const SizedBox(height: 10),
              const SizedBox(height: 10),
              TextFieldWidget(
                readOnly: true,
                controller: _dobController,
                hintText: 'Date of Birth',
                validator: (value) =>
                    value!.isEmpty ? 'Date of birth is required' : null,
                suffixIcon: const Icon(Icons.calendar_month),
                // readOnly: true,
                onTap: () async {
                  // Check if gender is selected
                  if (selectedGender != "Male" && selectedGender != "Female") {
                    setState(() {
                      selectedGender = "error"; // trigger the gender error
                    });
                    return;
                  }

                  FocusScope.of(context).unfocus();

                  // Calculate last valid date as per age rule
                  DateTime today = DateTime.now();
                  DateTime maxSelectableDate = selectedGender == "Male"
                      ? DateTime(today.year - 21, today.month, today.day)
                      : DateTime(today.year - 18, today.month, today.day);

                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: maxSelectableDate,
                    firstDate: DateTime(1900),
                    lastDate: maxSelectableDate,
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    _dobController.text = formattedDate;
                  }
                },
              ),
              DropdownWidget(
                controller: _maritalStatusController,
                label: "Marital Status",
                items: maritalStatusValues,
              ),
              if (isNoOfChildren)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      controller: _noOfChildrenController,
                      hintText: 'No of Children',
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              const SizedBox(height: 17.0),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  isChecked = true;
                  if (_formKey.currentState!.validate() &&
                      selectedGender != null &&
                      selectedGender != "error") {
                    _storeData();
                    Get.to(
                      const RegistrationDescription(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 800),
                    );
                  } else {
                    setState(() {
                      selectedGender ??= "error";
                    });
                  }
                },
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
