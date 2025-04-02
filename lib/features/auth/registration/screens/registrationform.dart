import 'package:flutter/material.dart';
import 'package:inakal/features/auth/registration/screens/registration_description.dart';
import 'package:inakal/features/auth/registration/widgets/country_state_city.dart';
import 'package:inakal/features/auth/registration/widgets/registration_loader.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/features/auth/registration/widgets/gender_selection.dart';
import 'package:inakal/constants/app_constants.dart';
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
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? selectedGender;

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r"[A-Z]").hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r"[a-z]").hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r"[0-9]").hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  var isChecked = false;
  
  void _storeData() {
    UserRegistrationData.userFirstName = _firstNameController.text;
    UserRegistrationData.userLastName = _secondNameController.text;
    UserRegistrationData.userEmail = _emailController.text;
    UserRegistrationData.userAddress = _addressController.text;
    UserRegistrationData.userCountry = _countryController.text;
    UserRegistrationData.userState = _stateController.text;
    UserRegistrationData.userDistrict = _cityController.text;
    UserRegistrationData.userPincode = _pincodeController.text;
    UserRegistrationData.userDob = _dobController.text;
    UserRegistrationData.userGender = selectedGender!;
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
              const RegistrationLoader(progress: 1),
              const SizedBox(height: 20),
              const Text(
                "What’s about you?",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryRed,
                ),
                textAlign: TextAlign.center,
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
              CountryStateCityWidget(
                  countryController: _countryController,
                  stateController: _stateController,
                  cityController: _cityController,
                  isChecked: isChecked),
              const SizedBox(height: 10),
              TextFieldWidget(
                controller: _pincodeController,
                hintText: 'Pincode',
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Pincode is required' : null,
              ),
              TextFieldWidget(
                controller: _dobController,
                hintText: 'Date of Birth',
                validator: (value) =>
                    value!.isEmpty ? 'Date of birth is required' : null,
                suffixIcon: const Icon(Icons.calendar_month),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    _dobController.text =
                        '${pickedDate.toLocal()}'.split(' ')[0];
                  }
                },
              ),

              const SizedBox(height: 15),
              GenderSelectionWidget(
                selectedGender: selectedGender,
                onGenderSelected: (gender) {
                  setState(() {
                    selectedGender = gender;
                  });
                },
              ),
              selectedGender == "error"
                  ? const Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                          "Gender is required",
                          style: TextStyle(color: AppColors.errorRed, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  )
                  : const SizedBox(height: 10),
              const SizedBox(height: 17.0),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  isChecked = true;
                  if (_formKey.currentState!.validate() &&
                      selectedGender != null &&
                      selectedGender != "error") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationDescription(),
                      ),
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
