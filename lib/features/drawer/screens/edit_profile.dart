import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient_from_top.dart';
import 'package:inakal/features/drawer/widgets/Edit_profle_dropdown.dart';
import 'package:inakal/features/auth/registration/screens/image_upload_screen.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/details_row_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_dropdown_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/editable_number_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/editable_text_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/header_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String selectedWeight = '60Kg';
  String selectedReligion = 'Hindu';
  String selectedCaste = 'Nair';
  String selectedGender = 'Female';
  String selectedMotherTongue = 'Malayalam';
  String selectedsubcaste = 'Nair';
  String selectedMaritalStatus = 'Single';
  String selectedBirthStar = 'Virgo';

  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _casteController = TextEditingController();
  final TextEditingController _subcasteController = TextEditingController();
  final TextEditingController _mothertongueController = TextEditingController();
  final TextEditingController _maritalStatusController = TextEditingController();

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _sNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phNoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _childController = TextEditingController();
  final TextEditingController _starsignController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fNameController.text = "Harsha";
    _sNameController.text = "Sreekanth";
    _emailController.text = "ath12@gamil.com";
    _phNoController.text = "9876543210";
    _dobController.text = "27/08/2002";
    _heightController.text = "5.6 ft";
    _weightController.text = "60 kg";
    _starsignController.text = "Virgo";
    _occupationController.text = "Software Developer";
    _incomeController.text = "20";
    _locationController.text = "Infopark, Kochi";
    _educationController.text = "MCA";
    _childController.text = "0";

    _genderController.text = "Female";
    _religionController.text = "Hindu";
    _casteController.text = "Nair";
    _subcasteController.text = "Nair";
    _mothertongueController.text = "Malayalam";
    _maritalStatusController.text = "Single";
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              TextSpan(
                                text: 'Profile',
                                style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.bold,
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
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/vectors/harsha1.jpg"),
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

///////////////////////////////Profile Image Done////////

                HeaderWidget(title: "Profile Details"),

/////////////////////////////////////////////////////////////////
                Container(
                    color: AppColors.bgsoftpink,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          //First Name
                          DetailsRowWidget(
                              label: "First Name",
                              valueWidget: EditableTextWidget(
                                  controller: _fNameController)),

                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),

                          //Second Name
                          DetailsRowWidget(
                              label: "Second Name",
                              valueWidget: EditableTextWidget(
                                  controller: _sNameController)),

                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),
                          //Email
                          DetailsRowWidget(
                              label: "Email",
                              valueWidget: EditableTextWidget(
                                  controller: _sNameController)),

                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),

                          //Phone Number
                          DetailsRowWidget(
                            label: "Phone Number",
                            valueWidget: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: IntlPhoneField(
                                controller: _phNoController,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                initialCountryCode: "IN",
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none, // Remove border
                                  enabledBorder: InputBorder
                                      .none, // Remove underline when enabled
                                  focusedBorder: InputBorder
                                      .none, // Remove underline when focused
                                  counterText: '', // Hide character counter
                                  isDense:
                                      true, // Reduce padding// Tight layout
                                ),
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),

                          //Date of Birth
                          DetailsRowWidget(
                            label: "Date of Birth",
                            valueWidget: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                  controller: _dobController,
                                  readOnly: true,
                                  decoration: null,
                                  onTap: () async {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );
                                    if (pickedDate != null) {
                                      _dobController.text =
                                          '${pickedDate.day < 10 ? "0${pickedDate.day}" : "${pickedDate.day}"}/${pickedDate.month < 10 ? "0${pickedDate.month}" : "${pickedDate.month}"}/${pickedDate.year}';
                                    }
                                  },
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),

                          const SizedBox(height: 16),
                          const Divider(),

                          DetailsRowWidget(
                              label: "Gender",
                              valueWidget: EditDropdownWidget(
                                controller: _genderController,
                                values: ["Male", "Female", "Others"],
                              )),
                          SizedBox(height: 11),
                          CustomButton(text: "Save", onPressed: () {}),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )),

////////////////////////////////////////////////////////////////////////////////

                HeaderWidget(title: "Personal Details"),

/////////////////////////////////////////////////////////////////////////////////////

                Container(
                  color: AppColors.bgsoftpink,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        //Height
                        DetailsRowWidget(
                            label: "Height",
                            valueWidget: EditableTextWidget(
                                controller: _heightController)),

                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),

                        //Weight
                        DetailsRowWidget(
                            label: "Weight",
                            valueWidget: EditableTextWidget(
                                controller: _weightController)),
                        SizedBox(height: 12),
                        const Divider(),

                        //Religion
                        DetailsRowWidget(
                            label: "Religion",
                            valueWidget: EditDropdownWidget(
                                controller: _religionController,
                                values: [
                                  'Hindu',
                                  'Muslim',
                                  'Christian',
                                  'Buddhist'
                                ])),

                        const Divider(),
                        const SizedBox(height: 15),

                        //Caste
                        DetailsRowWidget(
                            label: "Caste",
                            valueWidget: EditDropdownWidget(
                                controller: _casteController,
                                values: ['Nair', 'Ezhava', 'LC', 'Others'])),

                        const SizedBox(height: 12),
                        const Divider(),
                        SizedBox(height: 12),

                        //Sub Caste
                        DetailsRowWidget(
                            label: "Sub Caste",
                            valueWidget: EditDropdownWidget(
                                controller: _subcasteController,
                                values: ['Nair', 'Ezhava', 'LC', 'Others'])),

                        const SizedBox(height: 12),
                        const Divider(),
                        SizedBox(height: 12),

                        //Star Sign
                        DetailsRowWidget(
                          label: "Star Sign",
                          valueWidget: EditableTextWidget(
                              controller: _starsignController),
                        ),

                        SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),

                        //Mother Tongue
                        DetailsRowWidget(
                            label: "Mother Tongue",
                            valueWidget: EditDropdownWidget(
                                controller: _mothertongueController,
                                values: [
                                  'Malayalam',
                                  'Tamil',
                                  'Hindi',
                                  'Telugu'
                                ])),

                        const Divider(),
                        const SizedBox(height: 15),

                        //Marital Status
                        DetailsRowWidget(
                          label: "Marital Status",
                          valueWidget: EditDropdownWidget(
                              controller: _maritalStatusController,
                              values: [
                                'Single',
                                'Married',
                                'Divorced',
                                'Widowed'
                              ]),
                        ),

                        //write languages known code
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),

                        //Number of Children
                        DetailsRowWidget(
                          label: "Number of Children", 
                          valueWidget: EditableNumberWidget(controller: _childController)
                        ),
                        const SizedBox(height: 25,
                        ),
                        CustomButton(text: "Save", onPressed: () {}),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Living Address", textAlign: TextAlign.start),
                ),
                const SizedBox(height: 20),
                Container(
                  color: AppColors.bgsoftpink,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            EditProfleDropdown(
                                label: "Country",
                                items: const [
                                  'India',
                                  'Pakistan',
                                  'Australia',
                                  'London',
                                  'Canada',
                                  'Germany',
                                  'Austria',
                                  'others'
                                ],
                                controller: _countryController),
                            const SizedBox(
                              height: 16,
                              width: 16,
                            ),
                            EditProfleDropdown(
                                label: "State",
                                items: const [
                                  'India',
                                  'Pakistan',
                                  'Australia',
                                  'London',
                                  'Canada',
                                  'Germany',
                                  'Austria',
                                  'others'
                                ],
                                controller: _stateController)
                          ],
                        ),
                        const SizedBox(height: 16),
                        EditProfleDropdown(
                            label: "State",
                            items: const [
                              'India',
                              'Pakistan',
                              'Australia',
                              'London',
                              'Canada',
                              'Germany',
                              'Austria',
                              'others'
                            ],
                            controller: _stateController),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Professional & Educational Details",
                      textAlign: TextAlign.start),
                ),
                const SizedBox(height: 20),
                Container(
                  color: AppColors.bgsoftpink,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Occupation",
                                textAlign: TextAlign.start),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                controller: _occupationController,
                                textAlign: TextAlign.end,
                                decoration: null,
                                onSubmitted: (value) {
                                  setState(() {
                                    _occupationController.text = value;
                                  });
                                },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Work Location",
                                textAlign: TextAlign.start),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                controller: _locationController,
                                textAlign: TextAlign.end,
                                decoration: null,
                                onSubmitted: (value) {
                                  setState(() {
                                    _locationController.text = value;
                                  });
                                },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Annual Income",
                                textAlign: TextAlign.start),
                            Wrap(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextField(
                                    controller: _incomeController,
                                    textAlign: TextAlign.end,
                                    decoration: null,
                                    onSubmitted: (value) {
                                      setState(() {
                                        _incomeController.text = value;
                                      });
                                    },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.25),
                                  child: Text("LPA",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Highest Education",
                                textAlign: TextAlign.start),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                controller: _educationController,
                                textAlign: TextAlign.end,
                                decoration: null,
                                onSubmitted: (value) {
                                  setState(() {
                                    _educationController.text = value;
                                  });
                                },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Phone Number", textAlign: TextAlign.start),
                    Text("9876543210",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ]))),
        ]));
  }
}
