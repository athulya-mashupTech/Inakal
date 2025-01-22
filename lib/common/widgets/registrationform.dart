import 'package:flutter/material.dart';
import 'package:inakal/common/screen/registration_loader.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/common/widgets/gender_selection.dart';
import 'package:inakal/common/widgets/registration_hobbies.dart';
import 'package:inakal/constants/app_constants.dart';
import 'text_field_widget.dart';

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
    super.dispose();
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
              const Text(
                "Let's Get to Know Each Other",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              TextFieldWidget(
                controller: _fullNameController,
                hintText: 'Full Name',
              ),
              TextFieldWidget(
                controller: _emailController,
                hintText: 'Email ID',
              ),
              TextFieldWidget(
                controller: _addressController,
                hintText: 'Address',
              ),
              TextFieldWidget(
                controller: _countryController,
                hintText: 'Country',
              ),
              TextFieldWidget(
                controller: _cityController,
                hintText: 'City',
              ),
              TextFieldWidget(
                controller: _districtController,
                hintText: 'District',
              ),
              TextFieldWidget(
                controller: _pincodeController,
                hintText: 'Pincode',
                keyboardType: TextInputType.number,
              ),
              TextFieldWidget(
                controller: _dobController,
                hintText: 'Date of Birth',
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
              GenderSelectionWidget(
                selectedGender: selectedGender,
                onGenderSelected: (gender) {
                  setState(() {
                    selectedGender = gender;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              CustomButton(text: "Continue", onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationHobbies()));},),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
