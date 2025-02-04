import 'package:flutter/material.dart';
import 'package:inakal/features/registration/widgets/registration_loader.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/features/registration/widgets/gender_selection.dart';
import 'package:inakal/features/registration/screens/registration_hobbies.dart';
import 'package:inakal/constants/app_constants.dart';
import '../widgets/text_field_widget.dart';


class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? selectedGender;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _pincodeController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  

  String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  String pattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
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
                controller: _fullNameController,
                hintText: 'Full Name',
                validator: (value) => value!.isEmpty ? 'Full Name is required' : null,
              ),
              TextFieldWidget(
                controller: _emailController,
                hintText: 'Email ID',
                validator: _validateEmail,
              ),
              TextFieldWidget(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                validator: _validatePassword,
              ),
              TextFieldWidget(
                controller: _addressController,
                hintText: 'Address',
                validator: (value) => value!.isEmpty ? 'Address is required' : null,
              ),
              TextFieldWidget(
                controller: _countryController,
                hintText: 'Country',
                validator: (value) => value!.isEmpty ? 'Country is required' : null,
              ),
              TextFieldWidget(
                controller: _cityController,
                hintText: 'City',
                validator: (value) => value!.isEmpty ? 'City is required' : null,
              ),
              TextFieldWidget(
                controller: _districtController,
                hintText: 'District',
                validator: (value) => value!.isEmpty ? 'District is required' : null,
              ),
              TextFieldWidget(
                controller: _pincodeController,
                hintText: 'Pincode',
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Pincode is required' : null,
              ),
              GenderSelectionWidget(
                selectedGender: selectedGender,
                onGenderSelected: (gender) {
                  setState(() {
                    selectedGender = gender;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: "Continue", 
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationHobbies(),
                      ),
                    );
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
