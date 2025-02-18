import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/registration/screens/registration_hobbies.dart';
import 'package:inakal/features/registration/widgets/dropdown_feild.dart';
import 'package:inakal/features/registration/widgets/registration_loader.dart';
import 'package:inakal/features/registration/widgets/text_field_widget.dart';

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

  final TextEditingController controller = TextEditingController();

  final List<String> fruits = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Papaya',
    'Peach',
    'Pear',
    'Pineapple',
    'Plum',
    'Raspberry',
    'Strawberry',
    'Watermelon'
  ];

  Map<String, List<String>> religionsWithSubcastes = {
    "Hindu": [
      "Brahmin",
      "Kshatriya",
      "Vaishya",
      "Shudra",
      "Dalit",
      "Agarwal",
      "Iyer",
      "Iyengar",
      "Nair",
      "Maratha",
      "Jat",
      "Rajput",
      "Vokkaliga",
      "Lingayat",
      "Reddy",
      "Chettiar",
      "Yadav",
      "Gounder",
      "Gupta",
      "Mahishya",
      "Kayastha"
    ],
    "Christian": [
      "Roman Catholic",
      "Protestant",
      "Eastern Orthodox",
      "Pentecostal",
      "Evangelical",
      "Anglican",
      "Baptist",
      "Lutheran",
      "Methodist",
      "Presbyterian",
      "Seventh-day Adventist",
      "Jehovah's Witness",
      "Syrian Christian",
      "Marthoma",
      "Coptic Christian"
    ],
    "Muslim": [
      "Sunni",
      "Shia",
      "Ahmadiyya",
      "Sufi",
      "Bohra",
      "Ismaili",
      "Deobandi",
      "Barelvi",
      "Salafi",
      "Wahhabi",
      "Hanafi",
      "Maliki",
      "Shafi'i",
      "Hanbali"
    ],
    "Buddhist": [
      "Theravada",
      "Mahayana",
      "Vajrayana",
      "Zen",
      "Pure Land",
      "Nichiren",
      "Tibetan Buddhism"
    ],
    "Sikh": [
      "Jat Sikh",
      "Ramgarhia",
      "Khatri Sikh",
      "Arora Sikh",
      "Ravidasia",
      "Mazhabi Sikh",
      "Nanakpanthi",
      "Udasi"
    ],
    "Jew": [
      "Ashkenazi",
      "Sephardic",
      "Mizrahi",
      "Beta Israel",
      "Karaite",
      "Hasidic",
      "Orthodox",
      "Reform",
      "Conservative"
    ],
    "Jain": ["Digambara", "Shwetambara", "Sthanakvasi", "Terapanthi"]
  };
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

              /// Religion Autocomplete
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return religionsWithSubcastes.keys
                      .where((religion) => religion.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          ));
                },
                onSelected: (String selection) {
                  print(selection);
                  setState(() {
                    _religionController.text = selection;
                    _casteController.text = "";
                    availableCastes.clear();
                    availableCastes =
                        religionsWithSubcastes[_religionController.text] ?? [];
                    _casteController.clear();
                  });
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
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
                    return availableCastes;
                  }
                  return availableCastes
                      .where((caste) => caste.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          ));
                },
                onSelected: (String selection) {
                  _casteController.text = selection;
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  if (_casteController.text == "")
                    textEditingController.text = "";
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
                decoration: InputDecoration(
                  labelText: "Enter Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.primaryRed, width: 1.5),
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
