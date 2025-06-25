import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient_from_top.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/auth/registration/screens/image_upload_screen.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/educational_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/family_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/personal_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/additional_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/location_details.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_sections/profile_details.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userController = Get.find<UserDataController>();
  DropdownModel? dropdownModel;
  bool _isLoading = true;

  List<String> hobbies = [];
  List<String> languages = [];
  List<String> availableOccupations = [
    "Government Employee",
    "Private Employee",
    "Self Employed",
    "Business",
    "Engineer",
    "Doctor",
    "Lawyer",
    "Teacher",
    "Professor",
    "Banker",
    "Accountant",
    "Artist",
    "Consultant",
    "IT Professional",
    "Nurse",
    "Pharmacist",
    "Architect",
    "Scientist",
    "Retired",
    "Student",
    "Unemployed",
    "Other"
  ];
  List<String> annualIncomeRange = [
    "1 Lakh-3 Lakhs",
    "3 Lakhs-5 Lakhs",
    "5 Lakhs-7 Lakhs",
    "7 Lakhs-10 Lakhs",
    "10 Lakhs-15 Lakhs",
    "15 Lakhs-20 Lakhs",
    "20 Lakhs-30 Lakhs",
    "30 Lakhs-50 Lakhs",
    "50 Lakhs-75 Lakhs",
    "75 Lakhs-1 Crore",
    "1 Crore-2 Crores",
    "More than 2 Crores"
  ];
  List<String> availableEducation = [
    "PhD",
    "Post Doctoral",
    "MD",
    "MBBS",
    "B Tech",
    "MBA",
    "MSc",
    "MTech",
    "MA",
    "MPhil",
    "Diploma",
    "Graduate",
    "Post Graduate",
    "High School",
    "Intermediate",
    "MS",
    "Mch",
    "DM",
    "BDS",
    "MDS",
    "BPT",
    "MPT",
    "BAMS",
    "BHMS",
    "BPEd",
    "MPed",
    "LLB",
    "BA",
    "BSc",
    "BCom",
    "MCom",
    "ACCA",
    "CA",
    "TTC",
    "Nursing",
    "BEd",
    "CMA",
    "ITI",
    "MEd",
    "BPharm",
    "MPharm",
    "Pharm D",
    "Other"
  ];
  List<String> ageRange = [
    "18-30",
    "25-35",
    "30-40",
    "35-45",
    "40-50",
    "45-55",
    "50-60",
    "55-65"
  ];
  List<String> heightRange = [
    "4'0\"-4'5\" (121-137 cm)",
    "4'5\"-4'10\" (137-147 cm)",
    "4'10\"-5'3\" (147-160 cm)",
    "5'3\"-5'8\" (160-173 cm)",
    "5'8\"-6'1\" (173-185 cm)",
    "6'1\"-6'6\" (185-198 cm)",
    "6'6\"-7'0\" (198-213 cm)",
  ];
  List<String> availableLanguages = [
    "English",
    "Hindi",
    "Malayalam",
    "Tamil",
    "Telugu",
    "Bengali",
    "Marathi",
    "Gujarati",
    "Kannada",
    "Punjabi",
    "Urdu",
    "Odia",
    "Assamese",
    "Maithili",
    "Sanskrit",
    "Dogri",
    "Manipuri",
    "Kashmiri",
    "Sindhi",
    "Santali",
    "Nepali",
    "Bhojpuri",
    "Konkani",
    "Rajasthani",
    "Bodo",
    "Tulu",
  ];
  final Map<String, Map<String, List<String>>> religionCasteData = {
    "Hindu": {
      "Brahmin": [
        "select Sub Caste",
        "Don't wish to specify",
        "Ambalavasi",
        "Iyer",
        "Namboothiri",
        "Chakkala Nair",
        "Chettiar",
        "Dhevara",
        "Ezhuthedan",
        "Ezhava",
        "Ezhavathi",
        "Kshathreeyn",
        "Mannan",
        "Velan",
        "Vannan",
        "Nadar",
        "Nair",
        "Nambiar",
        "Panicker",
        "Pulaya",
        "Cheruman",
        "SC",
        "ST",
        "Thandan",
        "Theeya",
        "Vanika vaisiya",
        "Vanika chettiar",
        "Varriar",
        "Veera saiva",
        "Vellada pillai",
        "Moosad",
        "Kurup",
        "Pothuval",
        "Veluthedathu nair",
        "Velakkithala nair",
        "Viswakarma",
        "Gold smith",
        "Carpenter",
        "Black smith",
        "Inter caste",
        "Others"
      ],
      "Nair": [
        "select Sub Caste",
        "Don't wish to specify",
        "Ambalavasi",
        "Iyer",
        "Namboothiri",
        "Chakkala Nair",
        "Chettiar",
        "Dhevara",
        "Ezhuthedan",
        "Ezhava",
        "Ezhavathi",
        "Kshathreeyn",
        "Mannan",
        "Velan",
        "Vannan",
        "Nadar",
        "Nair",
        "Nambiar",
        "Panicker",
        "Pulaya",
        "Cheruman",
        "SC",
        "ST",
        "Thandan",
        "Theeya",
        "Vanika vaisiya",
        "Vanika chettiar",
        "Varriar",
        "Veera saiva",
        "Vellada pillai",
        "Moosad",
        "Kurup",
        "Pothuval",
        "Veluthedathu nair",
        "Velakkithala nair",
        "Viswakarma",
        "Gold smith",
        "Carpenter",
        "Black smith",
        "Inter caste",
        "Others"
      ],
      "Ezhava": [
        "select Sub Caste",
        "Don't wish to specify",
        "Ambalavasi",
        "Iyer",
        "Namboothiri",
        "Chakkala Nair",
        "Chettiar",
        "Dhevara",
        "Ezhuthedan",
        "Ezhava",
        "Ezhavathi",
        "Kshathreeyn",
        "Mannan",
        "Velan",
        "Vannan",
        "Nadar",
        "Nair",
        "Nambiar",
        "Panicker",
        "Pulaya",
        "Cheruman",
        "SC",
        "ST",
        "Thandan",
        "Theeya",
        "Vanika vaisiya",
        "Vanika chettiar",
        "Varriar",
        "Veera saiva",
        "Vellada pillai",
        "Moosad",
        "Kurup",
        "Pothuval",
        "Veluthedathu nair",
        "Velakkithala nair",
        "Viswakarma",
        "Gold smith",
        "Carpenter",
        "Black smith",
        "Inter caste",
        "Others"
      ],
      "SC": [
        "select Sub Caste",
        "Don't wish to specify",
        "Ambalavasi",
        "Iyer",
        "Namboothiri",
        "Chakkala Nair",
        "Chettiar",
        "Dhevara",
        "Ezhuthedan",
        "Ezhava",
        "Ezhavathi",
        "Kshathreeyn",
        "Mannan",
        "Velan",
        "Vannan",
        "Nadar",
        "Nair",
        "Nambiar",
        "Panicker",
        "Pulaya",
        "Cheruman",
        "SC",
        "ST",
        "Thandan",
        "Theeya",
        "Vanika vaisiya",
        "Vanika chettiar",
        "Varriar",
        "Veera saiva",
        "Vellada pillai",
        "Moosad",
        "Kurup",
        "Pothuval",
        "Veluthedathu nair",
        "Velakkithala nair",
        "Viswakarma",
        "Gold smith",
        "Carpenter",
        "Black smith",
        "Inter caste",
        "Others"
      ],
      "ST": [
        "select Sub Caste",
        "Don't wish to specify",
        "Ambalavasi",
        "Iyer",
        "Namboothiri",
        "Chakkala Nair",
        "Chettiar",
        "Dhevara",
        "Ezhuthedan",
        "Ezhava",
        "Ezhavathi",
        "Kshathreeyn",
        "Mannan",
        "Velan",
        "Vannan",
        "Nadar",
        "Nair",
        "Nambiar",
        "Panicker",
        "Pulaya",
        "Cheruman",
        "SC",
        "ST",
        "Thandan",
        "Theeya",
        "Vanika vaisiya",
        "Vanika chettiar",
        "Varriar",
        "Veera saiva",
        "Vellada pillai",
        "Moosad",
        "Kurup",
        "Pothuval",
        "Veluthedathu nair",
        "Velakkithala nair",
        "Viswakarma",
        "Gold smith",
        "Carpenter",
        "Black smith",
        "Inter caste",
        "Others"
      ],
      "Don't wish to specify": [
        "select Sub Caste",
        "Don't wish to specify",
        "Ambalavasi",
        "Iyer",
        "Namboothiri",
        "Chakkala Nair",
        "Chettiar",
        "Dhevara",
        "Ezhuthedan",
        "Ezhava",
        "Ezhavathi",
        "Kshathreeyn",
        "Mannan",
        "Velan",
        "Vannan",
        "Nadar",
        "Nair",
        "Nambiar",
        "Panicker",
        "Pulaya",
        "Cheruman",
        "SC",
        "ST",
        "Thandan",
        "Theeya",
        "Vanika vaisiya",
        "Vanika chettiar",
        "Varriar",
        "Veera saiva",
        "Vellada pillai",
        "Moosad",
        "Kurup",
        "Pothuval",
        "Veluthedathu nair",
        "Velakkithala nair",
        "Viswakarma",
        "Gold smith",
        "Carpenter",
        "Black smith",
        "Inter caste",
        "Others"
      ],
      "select Caste": ["select Sub Caste"],
      "Others": [
        "select Sub Caste",
        "Don't wish to specify",
        "Ambalavasi",
        "Iyer",
        "Namboothiri",
        "Chakkala Nair",
        "Chettiar",
        "Dhevara",
        "Ezhuthedan",
        "Ezhava",
        "Ezhavathi",
        "Kshathreeyn",
        "Mannan",
        "Velan",
        "Vannan",
        "Nadar",
        "Nair",
        "Nambiar",
        "Panicker",
        "Pulaya",
        "Cheruman",
        "SC",
        "ST",
        "Thandan",
        "Theeya",
        "Vanika vaisiya",
        "Vanika chettiar",
        "Varriar",
        "Veera saiva",
        "Vellada pillai",
        "Moosad",
        "Kurup",
        "Pothuval",
        "Veluthedathu nair",
        "Velakkithala nair",
        "Viswakarma",
        "Gold smith",
        "Carpenter",
        "Black smith",
        "Inter caste",
        "Others"
      ],
    },
    "Muslim": {
      "Shafi": [
        "Don't wish to specify",
        "select Sub Caste",
      ],
      "Hanafi": [
        "Don't wish to specify",
        "select Sub Caste",
      ],
      "Sunni": [
        "Don't wish to specify",
        "select Sub Caste",
      ],
      "Salafi": [
        "Don't wish to specify",
        "select Sub Caste",
      ],
      "Don't wish to specify": [
        "Don't wish to specify",
        "select Sub Caste",
      ],
      "Others": [
        "Don't wish to specify",
        "select Sub Caste",
      ],
      "select Caste": [
        "select Sub Caste",
        "select Sub Caste",
      ],
    },
    "Christian": {
      "Marthoma": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "Jacobite": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "Orthodox": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "Catholic": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "CSI": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "Knanaya": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "RC": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "Penthacost": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "Don't wish to specify": [
        "select Sub Caste",
        "Don't wish to specify",
        "Syrian",
        "Roman",
        "Latin",
        "Malankara",
        "Nadar",
        "Syro malabar",
        "SDA",
        "Church of God",
        "Born again",
        "Others"
      ],
      "select Caste": ["select Sub Caste"],
    },
    "Inter Religion": {
      "Don't wish to specify": [
        "select Sub Caste",
        "Don't wish to specify",
        "Others"
      ],
      "Others": ["select Sub Caste", "Don't wish to specify", "Others"],
      "select Caste": ["select Sub Caste"],
    },
    "Non Religious": {
      "Don't wish to specify": [
        "select Sub Caste",
        "Don't wish to specify",
        "Others"
      ],
      "Others": ["select Sub Caste", "Don't wish to specify", "Others"],
      "select Caste": ["select Sub Caste"],
    },
    "Other": {
      "Don't wish to specify": [
        "select Sub Caste",
        "Don't wish to specify",
        "Others"
      ],
      "Others": ["select Sub Caste", "Don't wish to specify", "Others"],
      "select Caste": ["select Sub Caste"],
    },
  };
  List<String> casteList = [];
  List<String> subCasteList = [];

  Future<void> _loadDropdownOptions() async {
    await EditProfileService()
        .getDropdownOptions(context: context)
        .then((value) {
      setState(() {
        dropdownModel = value;
      });
    });

    setState(() {
      _isLoading = false;
    });
  }

  void religionChanged(String value) {
    setState(() {
      _religionController.text = value;
      casteList = religionCasteData[value]?.keys.toList() ?? [];
      subCasteList = [];
      _casteController.text = "select Caste";
      _subcasteController.text = "select Sub Caste";
    });
  }

  void casteChanged(String value) {
    setState(() {
      _casteController.text = value;
      subCasteList = religionCasteData[selectedReligion]?[selectedCaste] ?? [];
      _subcasteController.text = "select Sub Caste";
    });
  }

  void subCasteChanged(String value) {
    setState(() {
      _religionController.text = value;
      casteList = religionCasteData[value]?.keys.toList() ?? [];
      subCasteList = [];
      // _casteController.clear();
      // _subcasteController.clear();
    });
  }

  // updateProfileDetails() async {
  //   await userController.updateProfileDetails(
  //     _fNameController.text,
  //     _sNameController.text,
  //     _emailController.text,
  //     _phNoController.text,
  //     _dobController.text,
  //     _genderController.text,
  //   );
  // }

  updatePersonalDetails() async {
    await userController.updatePersonalDetails(
        _heightController.text,
        _weightController.text,
        _religionController.text,
        _casteController.text,
        _subcasteController.text,
        _starsignController.text,
        _mothertongueController.text,
        _maritalStatusController.text,
        languages.join(','),
        _childController.text);
  }

  updateEducationAndProfessionalDetails() async {
    await userController.updateEduProfDetails(
        _highestEducationController.text,
        _educationController.text,
        _occupationController.text,
        _incomeController.text,
        _locationController.text);
  }

  updateFamilyDetails() async {
    await userController.updateFamilyDetails(
        _familyTypeController.text,
        _mothersOccupationController.text,
        _fathersOccupationController.text,
        _siblingsController.text,
        _siblingsMaritalStatusController.text);
  }

  updatePartnerPreferences() async {
    await userController.updatePartnerPrefDetails(
        _pagegroup.text,
        _pheightrange.text,
        _preligion.text,
        _pcaste.text,
        _psmoking.text,
        _pdrinking.text,
        _pfood.text,
        _pqualification.text,
        _pscore.text);
  }

  updateLocationDetails() async {
    await userController.updateLocationDetails(
        _countryController.text,
        _stateController.text,
        _districtController.text,
        _zipcodeController.text,
        _addressController.text,
        _cityController.text);
  }

  updateAdditionalDetails() async {
    await userController.updateAdditionalDetails(
        _aboutmecontroller.text,
        _smokinghabitcontroller.text,
        _drinkinghabitcontroller.text,
        _foodhabitcontroller.text,
        _profileapprovalcontroller.text,
        _profilecreatedcontroller.text,
        _instalinkcontroller.text,
        _fblinkcontroller.text,
        _linkedlnlinkcontroller.text,
        _youtubelinkcontroller.text);
  }

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _sNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phNoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _casteController = TextEditingController();
  final TextEditingController _subcasteController = TextEditingController();
  final TextEditingController _starsignController = TextEditingController();
  final TextEditingController _mothertongueController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  final TextEditingController _childController = TextEditingController();

  final TextEditingController _highestEducationController =
      TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _familyTypeController = TextEditingController();
  final TextEditingController _mothersOccupationController =
      TextEditingController();
  final TextEditingController _fathersOccupationController =
      TextEditingController();
  final TextEditingController _siblingsController = TextEditingController();
  final TextEditingController _siblingsMaritalStatusController =
      TextEditingController();

  final TextEditingController _pagegroup = TextEditingController();
  final TextEditingController _pheightrange = TextEditingController();
  final TextEditingController _preligion = TextEditingController();
  final TextEditingController _pcaste = TextEditingController();
  final TextEditingController _psmoking = TextEditingController();
  final TextEditingController _pdrinking = TextEditingController();
  final TextEditingController _pfood = TextEditingController();
  final TextEditingController _pqualification = TextEditingController();
  final TextEditingController _pscore = TextEditingController();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _aboutmecontroller = TextEditingController();
  final TextEditingController _smokinghabitcontroller = TextEditingController();
  final TextEditingController _drinkinghabitcontroller =
      TextEditingController();
  final TextEditingController _foodhabitcontroller = TextEditingController();
  final TextEditingController _profileapprovalcontroller =
      TextEditingController();
  final TextEditingController _profilecreatedcontroller =
      TextEditingController();
  final TextEditingController _instalinkcontroller = TextEditingController();
  final TextEditingController _fblinkcontroller = TextEditingController();
  final TextEditingController _linkedlnlinkcontroller = TextEditingController();
  final TextEditingController _youtubelinkcontroller = TextEditingController();

  String selectedWeight = '60Kg';
  String selectedReligion = 'Hindu';
  String selectedCaste = 'Nair';
  String selectedGender = 'Female';
  String selectedMotherTongue = 'Malayalam';
  String selectedsubcaste = 'Nair';
  String selectedMaritalStatus = 'Single';
  String selectedBirthStar = 'Virgo';

  @override
  void initState() {
    super.initState();
    _loadDropdownOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(children: [
          const LightPinkGradientFromTop(),
          Positioned(
            top: 50,
            left: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14),
              child: Image.asset(
                "assets/vectors/dotted_design3.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Edit ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                              TextSpan(
                                text: 'Profile',
                                style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      // Profile Image
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColors.primaryRed,
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userController.userData.value.user?.image ??
                                      "assets/vectors/harsha1.jpg"),
                              radius: 80,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primaryRed,
                                  width: 3,
                                ),
                              ),
                              width: 50,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: AppColors.primaryRed,
                                  size: 22,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ImageUploadScreen()));
                                },
                                iconSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Profile Details
                _isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        children: [
                          ProfileDetails(dropdownModel!),
                          SizedBox(height: 2),
                          PersonalDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          EducationalDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          FamilyDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          LocationDetails(dropdownModel!),
                          SizedBox(
                            height: 2,
                          ),
                          AdditionalDetails(dropdownModel!),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
              ]))),
        ]));
  }
}
