import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/model/auth_dropdown_model.dart';
import 'package:inakal/features/auth/registration/screens/registration_hobbies.dart';
import 'package:inakal/features/auth/registration/widgets/dropdown_feild.dart';
import 'package:inakal/features/auth/registration/widgets/registration_loader.dart';
import 'package:inakal/features/auth/registration/widgets/text_field_widget.dart';
import 'package:inakal/features/auth/service/auth_service.dart';
import 'package:inakal/features/drawer/model/caste_subcaste_options_model.dart';

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
  final TextEditingController _subcasteController = TextEditingController();
  final TextEditingController _birthStarController = TextEditingController();

  TextEditingController _casteDisplayController = TextEditingController();
  TextEditingController _subcasteDisplayController = TextEditingController();

  @override
  void dispose() {
    _religionController.dispose();
    _birthStarController.dispose();
    super.dispose();
  }

  final TextEditingController _descriptionController = TextEditingController();

  final List<String> zodiacSigns = [
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpio",
    "Sagittarius",
    "Capricorn",
    "Aquarius",
    "Pisces"
  ];
  List<String> availableCastes = [];

  final AuthController regController = Get.find();
  void _storeData() {
    regController.setReligionDetails(
      religion: _religionController.text,
      caste: _casteController.text,
      subcaste: _subcasteController.text,
      birthStar: _birthStarController.text,
      description: _descriptionController.text,
    );

    print(_religionController.text);
    print(_casteController.text);
    print(_subcasteController.text);
    print(_birthStarController.text);
    print(_descriptionController.text);
  }

  List<String> filteredReligions = [];
  AuthDropdownModel authDropdownOptions = AuthDropdownModel();

  Future<void> getAuthOptions() async {
    final value = await AuthService().getAuthOptions();
    setState(() {
      authDropdownOptions = value;
      filteredReligions = (authDropdownOptions.data?.religions ?? [])
          .map((state) => state.name ?? "")
          .toList();
    });
  }

  CasteSubcasteOptionsModel casteSubcasteOptions = CasteSubcasteOptionsModel();
  List<String> filteredCastes = [];
  List<String> filteredSubcastes = [];

  Future<void> getCasteSubcasteOptions() async {
    final value =
        await AuthService().getCasteSubcasteOptions(_religionController.text);
    setState(() {
      print("object");
      casteSubcasteOptions = value;
      filteredCastes = (casteSubcasteOptions.castes ?? [])
          .map((caste) => caste.name ?? "")
          .toList();
      filteredSubcastes = (casteSubcasteOptions.subcastes ?? [])
          .map((subcaste) => subcaste.name ?? "")
          .toList();
      print(filteredCastes.length);
      print(filteredSubcastes.length);
    });
  }

  @override
  void initState() {
    getAuthOptions();
    super.initState();
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
              const RegistrationLoader(progress: 3),
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

              /// Religion Autocomplete
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return filteredReligions
                      .where((religion) => religion.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          ));
                },
                onSelected: (String selection) {
                  print(selection);
                  setState(() {
                    _religionController.text =
                        ((authDropdownOptions.data ?? Data()).religions ?? [])
                                .firstWhere(
                                    (religion) => religion.name == selection,
                                    orElse: () => RelStaOc(id: ""))
                                .id ??
                            "";
                    print(_religionController.text);

                    // Clear controller values
                    _casteController.clear();
                    _subcasteController.clear();

                    // Clear displayed text
                    _casteDisplayController.clear();
                    _subcasteDisplayController.clear();

                    getCasteSubcasteOptions();
                  });
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {

                  focusNode.addListener(() {
                    if (!focusNode.hasFocus) {
                      final currentText = textEditingController.text;
                      bool isValidState = filteredReligions.any((state) =>
                          state.toLowerCase() == currentText.toLowerCase());

                      if (!isValidState && currentText.isNotEmpty) {
                        textEditingController.clear();
                        setState(() {
                          _religionController.clear();
                        });
                      }
                    }
                  });

                  return TextFieldWidget(
                    controller: textEditingController,
                    hintText: "Select Religion",
                    focusNode: focusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Religion is required';
                      }
                      return null;
                    },
                  );
                },
              ),

              /// Caste Autocomplete (Filtered by Religion)
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return filteredCastes
                      .where((caste) => caste.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          ));
                },
                onSelected: (String selection) {
                  print(selection);
                  setState(() {
                    _casteController.text = (casteSubcasteOptions.castes ?? [])
                            .firstWhere((caste) => caste.name == selection,
                                orElse: () => Castes(id: ""))
                            .id ??
                        "";
                    print(_casteController.text);
                  });
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  _casteDisplayController =
                      textEditingController; // Store reference

                  focusNode.addListener(() {
                    if (!focusNode.hasFocus) {
                      final currentText = textEditingController.text;
                      bool isValidCaste = filteredCastes.any((caste) =>
                          caste.toLowerCase() == currentText.toLowerCase());

                      if (!isValidCaste && currentText.isNotEmpty) {
                        textEditingController.clear();
                        setState(() {
                          _casteController.clear();
                        });
                      }
                    }
                  });

                  return TextFieldWidget(
                    controller: textEditingController,
                    hintText: "Select Caste",
                    focusNode: focusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Caste is required';
                      }
                      return null;
                    },
                  );
                },
              ),

              /// Subcaste Autocomplete (Filtered by Religion)
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return filteredSubcastes
                      .where((subcaste) => subcaste.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          ));
                },
                onSelected: (String selection) {
                  print(selection);
                  setState(() {
                    _subcasteController.text =
                        (casteSubcasteOptions.subcastes ?? [])
                                .firstWhere(
                                    (subcaste) => subcaste.name == selection,
                                    orElse: () => Subcastes(id: ""))
                                .id ??
                            "";
                    print(_subcasteController.text);
                  });
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  _subcasteDisplayController =
                      textEditingController; // Store reference

                  focusNode.addListener(() {
                    if (!focusNode.hasFocus) {
                      final currentText = textEditingController.text;
                      bool isValidSubcaste = filteredSubcastes.any((subcaste) =>
                          subcaste.toLowerCase() == currentText.toLowerCase());

                      if (!isValidSubcaste && currentText.isNotEmpty) {
                        textEditingController.clear();
                        setState(() {
                          _subcasteController.clear();
                        });
                      }
                    }
                  });

                  return TextFieldWidget(
                    controller: textEditingController,
                    hintText: "Select Subcaste",
                    focusNode: focusNode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Subcaste is required';
                      }
                      return null;
                    },
                  );
                },
              ),

              DropdownWidget(
                label: 'Birth Star',
                items: zodiacSigns,
                controller: _birthStarController,
              ),
              const SizedBox(height: 20),
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
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Enter Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.primaryRed, width: 1.5),
                    borderRadius: BorderRadius.circular(5),
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
                      _storeData();
                      Get.to(
                        const RegistrationHobbies(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 800),
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
