import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/registration/screens/registration_hobbies.dart';
import 'package:inakal/features/registration/widgets/dropdown_feild.dart';
import 'package:inakal/features/registration/widgets/registration_loader.dart';

class RegistrationDescription extends StatefulWidget {
  const RegistrationDescription({super.key});

  @override
  State<RegistrationDescription> createState() =>
      _RegistrationDescriptionState();
}

class _RegistrationDescriptionState extends State<RegistrationDescription> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _casteController = TextEditingController();
  final TextEditingController _birthStarController = TextEditingController();

  @override
  void dispose() {
    _religionController.dispose();
    _birthStarController.dispose();
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
              const RegistrationLoader(progress: 2),
              const SizedBox(height: 20),
              const Text(
                "Add your details to know more !",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryRed,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              DropdownWidget(
                label: 'Religion',
                items: const ['Hindu', 'Muslim', 'Christian', 'others'],
                controller: _religionController,
              ),
              const SizedBox(height: 15),
              DropdownWidget(
                label: 'Caste',
                items: const [
                  'lc',
                  'rc',
                  'jacobite',
                  'nair',
                  'ezhava',
                  'bhramin',
                  'panditar',
                  'others'
                ],
                controller: _casteController,
              ),
              const SizedBox(height: 15),
              DropdownWidget(
                label: 'Birth Star',
                items: const ['punardam', 'revathi', 'uthradam', 'others'],
                controller: _birthStarController,
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Introduce yourself briefly to know more.",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration:  InputDecoration(
                  labelText: "Enter Description",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
            borderRadius: BorderRadius.circular(30.0),
                ),
                ),
                maxLines: null, 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomButton(
                  text: "Continue",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrationHobbies(),
                        ),
                      );
                    }
                  }),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
