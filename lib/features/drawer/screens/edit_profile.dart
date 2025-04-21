import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient_from_top.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/drawer/widgets/Edit_profle_dropdown.dart';
import 'package:inakal/features/auth/registration/screens/image_upload_screen.dart';
import 'package:inakal/features/drawer/widgets/add_hobbie_widget.dart';
import 'package:inakal/features/drawer/widgets/details_column_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/details_row_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/edit_dropdown_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/editable_number_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/editable_text_widget.dart';
import 'package:inakal/features/drawer/widgets/edit_profile_widgets/header_widget.dart';
import 'package:inakal/features/drawer/widgets/option_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final userController = Get.find<UserDataController>();

  List<String> hobbies = [];
  List<String> languages = [];

  updateProfileDetails() async {
    await userController.updateProfileDetails(
      _fNameController.text,
      _sNameController.text,
      _emailController.text,
      _phNoController.text,
      _dobController.text,
      _genderController.text,
    );
  }

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
    _fNameController.text = userController.userData.value.user?.firstName ?? "";
    _sNameController.text = userController.userData.value.user?.lastName ?? "";
    _emailController.text = userController.userData.value.user?.email ?? "";
    _phNoController.text = userController.userData.value.user?.phone ?? "";
    _dobController.text = userController.userData.value.user?.dob ?? "";
    _heightController.text =
        userController.userData.value.user?.height ?? "0.0";
    _weightController.text =
        userController.userData.value.user?.weight ?? "0.0";
    _starsignController.text =
        userController.userData.value.user?.starSign ?? "";
    _occupationController.text =
        userController.userData.value.user?.occupation ?? "";
    _incomeController.text =
        userController.userData.value.user?.annualIncome ?? "";
    _educationController.text =
        userController.userData.value.user?.educationDetails ?? "";
    _childController.text =
        userController.userData.value.user?.numberOfChildren ?? "";

    _genderController.text = userController.userData.value.user?.gender ?? "";
    _religionController.text =
        userController.userData.value.user?.religion ?? "";
    _casteController.text = userController.userData.value.user?.caste ?? "";

    _subcasteController.text =
        userController.userData.value.user?.subCaste ?? "";
    _mothertongueController.text =
        userController.userData.value.user?.motherTongue ?? "";
    _maritalStatusController.text =
        userController.userData.value.user?.maritalStatus ?? "";

    _highestEducationController.text =
        userController.userData.value.user?.highestEducation ?? "";
    _occupationController.text =
        userController.userData.value.user?.occupation ?? "";
    _incomeController.text =
        userController.userData.value.user?.annualIncome ?? "";
    _locationController.text =
        userController.userData.value.user?.workLocation ?? "";

    _familyTypeController.text =
        userController.userData.value.user?.familyType ?? "";
    _mothersOccupationController.text =
        userController.userData.value.user?.mothersOccupation ?? "";
    _fathersOccupationController.text =
        userController.userData.value.user?.fathersOccupation ?? "";
    _siblingsController.text =
        userController.userData.value.user?.numberOfSiblings ?? "";
    _siblingsMaritalStatusController.text =
        userController.userData.value.user?.siblingsMaritalStatus ?? "";

    _pagegroup.text =
        userController.userData.value.user?.preferredAgeRange ?? "";
    _pheightrange.text =
        userController.userData.value.user?.preferredHeightRange ?? "";
    _preligion.text =
        userController.userData.value.user?.preferredReligion ?? "";

    _pcaste.text = userController.userData.value.user?.preferredCaste ?? "";
    _psmoking.text =
        userController.userData.value.user?.preferredSmokingHabits ?? "";
    _pdrinking.text =
        userController.userData.value.user?.preferredDrinkingHabits ?? "";
    _pfood.text = userController.userData.value.user?.foodPreferences ?? "";
    _pqualification.text =
        userController.userData.value.user?.preferredQualification ?? "";
    _pscore.text = userController.userData.value.user?.score ?? "";

    _countryController.text = userController.userData.value.user?.country ?? "";
    _stateController.text = userController.userData.value.user?.state ?? "";
    _districtController.text =
        userController.userData.value.user?.district ?? "";
    _cityController.text =
        userController.userData.value.user?.currentCity ?? "";
    _zipcodeController.text = userController.userData.value.user?.zipCode ?? "";
    _addressController.text = userController.userData.value.user?.address ?? "";

    _aboutmecontroller.text = userController.userData.value.user?.aboutMe ?? "";
    _smokinghabitcontroller.text =
        userController.userData.value.user?.smokingHabits ?? "";
    _drinkinghabitcontroller.text =
        userController.userData.value.user?.drinkingHabits ?? "";
    _foodhabitcontroller.text =
        userController.userData.value.user?.foodPreferences ?? "";
    _profileapprovalcontroller.text =
        userController.userData.value.user?.profileApproved ?? "";
    _profilecreatedcontroller.text =
        userController.userData.value.user?.profileCreatedBy ?? "";
    _instalinkcontroller.text =
        userController.userData.value.user?.instagramLink ?? "";
    _fblinkcontroller.text =
        userController.userData.value.user?.facebookLink ?? "";
    _linkedlnlinkcontroller.text =
        userController.userData.value.user?.linkedinLink ?? "";
    _youtubelinkcontroller.text =
        userController.userData.value.user?.youtubeLink ?? "";

    hobbies = "${userController.userData.value.user?.hobbies}".split(",");
    languages =
        "${userController.userData.value.user?.languagesKnown}".split(",");
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
                                  controller: _emailController)),

                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 12),

                          //Phone Number
                          DetailsRowWidget(
                            label: "Phone Number",
                            valueWidget: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
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
                                          '${pickedDate.year}-${pickedDate.month < 10 ? "0${pickedDate.month}" : "${pickedDate.month}"}-${pickedDate.day < 10 ? "0${pickedDate.day}" : "${pickedDate.day}"}';
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
                          CustomButton(
                              text: "Save",
                              onPressed: () async {
                                await updateProfileDetails();
                                await EditProfileService().updateProfileDetails(
                                    userData: userController.userData.value,
                                    context: context);
                              }),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        const SizedBox(height: 15),
                        const Divider(),
                        const SizedBox(height: 15),

                        //write languages known code
                        DetailsColumnWidget(
                            label: "Languages Known",
                            valueWidget: Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                ...languages.map((language) {
                                  return OptionWidget(
                                    label: language,
                                    icon: Icons.close,
                                    onPressed: () {
                                      setState(() {
                                        languages.remove(language);
                                      });
                                    },
                                  );
                                }).toList(),
                                // Add Language Button
                                AddHobbieWidget(
                                  label: "Add",
                                  icon: Icons.add,
                                  onPressed: () async {
                                    final newLanguage =
                                        await showDialog<String>(
                                      context: context,
                                      builder: (context) {
                                        final TextEditingController
                                            _controller =
                                            TextEditingController();
                                        return AlertDialog(
                                          title: Text("Add Language"),
                                          content: TextField(
                                            controller: _controller,
                                            decoration: InputDecoration(
                                              hintText: "Enter your language",
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text("Cancel"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                final language =
                                                    _controller.text.trim();
                                                if (language.isNotEmpty) {
                                                  Navigator.pop(
                                                      context, language);
                                                }
                                              },
                                              child: Text("Add"),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    if (newLanguage != null &&
                                        newLanguage.isNotEmpty) {
                                      setState(() {
                                        languages.add(newLanguage);
                                      });
                                    }
                                  }, // Can be empty since the outer GestureDetector handles it
                                )
                              ],
                            )),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),

                        //Number of Children
                        DetailsRowWidget(
                            label: "Number of Children",
                            valueWidget: EditableNumberWidget(
                                controller: _childController)),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                            text: "Save",
                            onPressed: () async {
                              updatePersonalDetails();
                              await EditProfileService().updatePersonalDetails(
                                  userData: userController.userData.value,
                                  context: context);
                            }),
                      ],
                    ),
                  ),
                ),

//////////////////////////////////////////////////////////////////////////////////////////////////////////
                HeaderWidget(title: "Educational and Professional Details"),
/////////////////////////////////////////////////////////////////////////////////////////////////////////

                Container(
                  color: AppColors.bgsoftpink,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        //highest education
                        DetailsRowWidget(
                            label: "Highest Education",
                            valueWidget: EditDropdownWidget(
                                controller: _highestEducationController,
                                values: [
                                  "Matriculate",
                                  "Plus Two",
                                  "Undergraduate",
                                  "Postgraduate",
                                  "PhD",
                                  "BTech"
                                ])),
                        const Divider(),
                        const SizedBox(height: 15),

                        //Educational details
                        DetailsRowWidget(
                            label: "Educational Details",
                            valueWidget: EditableTextWidget(
                                controller: _educationController)),
                        const Divider(),
                        const SizedBox(height: 15),

                        //occupation
                        DetailsRowWidget(
                            label: "Occupation",
                            valueWidget: EditDropdownWidget(
                                controller: _occupationController,
                                values: [
                                  "Engineer",
                                  "Developer",
                                  "lecturer",
                                  "Doctor",
                                  "Driver",
                                  "Business"
                                ])),
                        const Divider(),
                        const SizedBox(height: 15),

                        //income
                        DetailsRowWidget(
                            label: "Annual Income",
                            valueWidget: EditDropdownWidget(
                                controller: _incomeController,
                                values: [
                                  "1-5",
                                  "5-10",
                                  "10-16",
                                  "15-20",
                                  "Above 20LPA"
                                ])),
                        const Divider(),
                        const SizedBox(height: 15),

                        //worklocation
                        DetailsRowWidget(
                            label: "Work Location",
                            valueWidget: EditableTextWidget(
                                controller: _locationController)),
                        const SizedBox(height: 15),
                        CustomButton(
                            text: "Save",
                            onPressed: () async {
                              updateEducationAndProfessionalDetails();
                              await EditProfileService()
                                  .updateEducationAndProfessionalDetails(
                                      userData: userController.userData.value,
                                      context: context);
                            }),
                      ],
                    ),
                  ),
                ),

////////////////////////////////////////////////////////////////////////////////

                HeaderWidget(title: "Family Details"),

/////////////////////////////////////////////////////////////////////////////////////

                Container(
                    color: AppColors.bgsoftpink,
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(children: [
                          //Family Type
                          DetailsRowWidget(
                              label: "Family Type",
                              valueWidget: EditDropdownWidget(
                                  controller: _familyTypeController,
                                  values: ["Nuclear", "Joint"])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //Mothers occupation
                          DetailsRowWidget(
                              label: "Mothers occupation",
                              valueWidget: EditableTextWidget(
                                  controller: _mothersOccupationController)),
                          const Divider(),
                          const SizedBox(height: 15),

                          // Fathers occupation
                          DetailsRowWidget(
                              label: "Fathers occupation",
                              valueWidget: EditableTextWidget(
                                  controller: _fathersOccupationController)),
                          const Divider(),
                          const SizedBox(height: 15),

                          //Number of siblings
                          DetailsRowWidget(
                              label: "Number of Siblings",
                              valueWidget: EditableNumberWidget(
                                  controller: _siblingsController)),
                          const Divider(),
                          const SizedBox(height: 15),

                          //Sibling Marital Status
                          DetailsRowWidget(
                            label: "Sibling Marital Status",
                            valueWidget: EditDropdownWidget(
                                controller: _siblingsMaritalStatusController,
                                values: [
                                  'Single',
                                  'Married',
                                  'Divorced',
                                  'Widowed'
                                ]),
                          ),
                          SizedBox(height: 12),
                          CustomButton(
                              text: "Save",
                              onPressed: () async {
                                updateFamilyDetails();
                                await EditProfileService().updateFamilyDetails(
                                    userData: userController.userData.value,
                                    context: context);
                              }),
                        ]))),

////////////////////////////////////////////////////////////////////////////////

                HeaderWidget(title: "Partners Preferences"),

/////////////////////////////////////////////////////////////////////////////////////

                Container(
                    color: AppColors.bgsoftpink,
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(children: [
                          //Prefered Age group
                          DetailsRowWidget(
                              label: "Prefered Age group",
                              valueWidget: EditDropdownWidget(
                                  controller: _pagegroup,
                                  values: [
                                    "18-24",
                                    "24-29",
                                    "30-40",
                                    "35 to more"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //prefered height range
                          DetailsRowWidget(
                              label: "Prefered Height Range",
                              valueWidget: EditDropdownWidget(
                                  controller: _pheightrange,
                                  values: [
                                    "140-150",
                                    "150-160",
                                    "160-173",
                                    "170-180"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //prefered religion
                          DetailsRowWidget(
                              label: "Prefered Religion",
                              valueWidget: EditDropdownWidget(
                                  controller: _preligion,
                                  values: [
                                    "hindu",
                                    "Muslim",
                                    "Christian",
                                    "Others"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //prefered caste
                          DetailsRowWidget(
                              label: "Prefered Caste",
                              valueWidget: EditDropdownWidget(
                                  controller: _pcaste,
                                  values: [
                                    "Nair",
                                    "RC",
                                    "LC",
                                    "Ezhava",
                                    "Others"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //prefered smoking habit
                          DetailsRowWidget(
                              label: "Prefered Smoking Habit",
                              valueWidget: EditDropdownWidget(
                                  controller: _psmoking,
                                  values: ["Yes", "No", "occasionally"])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //prefered drinking habit
                          DetailsRowWidget(
                              label: "Prefered Drinking Habit",
                              valueWidget: EditDropdownWidget(
                                  controller: _pdrinking,
                                  values: ["Yes", "No", "occasionally"])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //prefered food habit
                          DetailsRowWidget(
                              label: "Prefered Food Habit",
                              valueWidget: EditDropdownWidget(
                                  controller: _pfood,
                                  values: [
                                    "Vegetarian",
                                    "Non-Vegeterian",
                                    "Vegan",
                                    "Others"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //prefered qualification
                          DetailsRowWidget(
                              label: "Prefered Qualification",
                              valueWidget: EditDropdownWidget(
                                  controller: _pqualification,
                                  values: [
                                    "Matriculate",
                                    "Plus Two",
                                    "graduate",
                                    "Postgraduate",
                                    "Others"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //score
                          DetailsRowWidget(
                              label: "Score",
                              valueWidget: EditableNumberWidget(
                                editable: false,
                                controller: _pscore,
                              )),
                          const SizedBox(height: 15),
                          CustomButton(
                              text: "Save",
                              onPressed: () async {
                                updatePartnerPreferences();
                                await EditProfileService()
                                    .updatePreferencenDetails(
                                        userData: userController.userData.value,
                                        context: context);
                              }),
                        ]))),

////////////////////////////////////////////////////////////////////////////////

                HeaderWidget(title: "Location Details"),

/////////////////////////////////////////////////////////////////////////////////////

                Container(
                    color: AppColors.bgsoftpink,
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(children: [
                          //Address
                          DetailsRowWidget(
                              label: "Address",
                              valueWidget: EditableTextWidget(
                                controller: _addressController,
                              )),
                          const Divider(),
                          const SizedBox(height: 15),

                          //state
                          DetailsRowWidget(
                              label: "State",
                              valueWidget: EditDropdownWidget(
                                  controller: _stateController,
                                  values: [
                                    "Kerala",
                                    "Tamil Nadu",
                                    "Karnataka",
                                    "Andhra Pradesh"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //District
                          DetailsRowWidget(
                              label: "District",
                              valueWidget: EditDropdownWidget(
                                  controller: _districtController,
                                  values: [
                                    "Ernakulam",
                                    "Kochi",
                                    "Kollam",
                                    "Palakkad",
                                    "Kottayam"
                                  ])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //country
                          DetailsRowWidget(
                              label: "Country",
                              valueWidget: EditDropdownWidget(
                                  controller: _countryController,
                                  values: ["India", "USA", "UK", "Canada"])),
                          const Divider(),
                          const SizedBox(height: 15),

                          //zipcode
                          DetailsRowWidget(
                              label: "ZipCode",
                              valueWidget: EditableTextWidget(
                                controller: _zipcodeController,
                              )),
                          const Divider(),
                          const SizedBox(height: 15),

                          //city
                          DetailsRowWidget(
                              label: "CurrentCity",
                              valueWidget: EditableTextWidget(
                                controller: _cityController,
                              )),

                          const SizedBox(height: 15),
                          CustomButton(
                              text: "Save",
                              onPressed: () async {
                                updateLocationDetails();
                                await EditProfileService()
                                    .updateLocationDetails(
                                        userData: userController.userData.value,
                                        context: context);
                              }),
                          const SizedBox(height: 15),
                        ]))),

////////////////////////////////////////////////////////////////////////////////

                HeaderWidget(title: "Additional Details"),

/////////////////////////////////////////////////////////////////////////////////////

                Container(
                    color: AppColors.bgsoftpink,
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //About Me
                              DetailsRowWidget(
                                  label: "About Me",
                                  valueWidget: EditableTextWidget(
                                    controller: _aboutmecontroller,
                                    justify: true,
                                  )),
                              const Divider(),
                              const SizedBox(height: 15),
                              DetailsColumnWidget(
                                label: "Hobbies",
                                valueWidget: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: [
                                    ...hobbies.map((hobby) {
                                      return OptionWidget(
                                        label: hobby,
                                        icon: Icons.close,
                                        onPressed: () {
                                          setState(() {
                                            hobbies.remove(hobby);
                                          });
                                        },
                                      );
                                    }).toList(),
                                    // Add Hobby Button
                                    AddHobbieWidget(
                                      label: "Add",
                                      icon: Icons.add,
                                      onPressed: () async {
                                        final newHobby =
                                            await showDialog<String>(
                                          context: context,
                                          builder: (context) {
                                            final TextEditingController
                                                _controller =
                                                TextEditingController();
                                            return AlertDialog(
                                              title: Text("Add Hobby"),
                                              content: TextField(
                                                controller: _controller,
                                                decoration: InputDecoration(
                                                  hintText: "Enter your hobby",
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context), // cancel
                                                  child: Text("Cancel"),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    final hobby =
                                                        _controller.text.trim();
                                                    if (hobby.isNotEmpty) {
                                                      Navigator.pop(
                                                          context, hobby);
                                                    }
                                                  },
                                                  child: Text("Add"),
                                                ),
                                              ],
                                            );
                                          },
                                        );

                                        if (newHobby != null &&
                                            newHobby.isNotEmpty) {
                                          setState(() {
                                            hobbies.add(newHobby);
                                          });
                                        }
                                      }, // Can be empty since the outer GestureDetector handles it
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Divider(),
                              const SizedBox(height: 15),

                              //smoking habit
                              DetailsRowWidget(
                                  label: "Smoking Habit",
                                  valueWidget: EditDropdownWidget(
                                      controller: _smokinghabitcontroller,
                                      values: ["Yes", "No"])),
                              const Divider(),
                              const SizedBox(height: 15),

                              //drinking habit
                              DetailsRowWidget(
                                  label: "Drinking Habit",
                                  valueWidget: EditDropdownWidget(
                                      controller: _drinkinghabitcontroller,
                                      values: ["Yes", "No"])),
                              const Divider(),
                              const SizedBox(height: 15),

                              //food habit
                              DetailsRowWidget(
                                  label: "Food Habit",
                                  valueWidget: EditDropdownWidget(
                                      controller: _foodhabitcontroller,
                                      values: [
                                        "Vegetarian",
                                        "Non-Vegeterian",
                                        "Vegan",
                                        "Others"
                                      ])),
                              const Divider(),
                              const SizedBox(height: 15),

                              //profile approved
                              DetailsRowWidget(
                                  label: "Profile Approved",
                                  valueWidget: EditDropdownWidget(
                                      controller: _profileapprovalcontroller,
                                      values: ["0", "1"])),
                              const Divider(),
                              const SizedBox(height: 15),

                              //profile created by
                              DetailsRowWidget(
                                  label: "Profile Created By",
                                  valueWidget: EditDropdownWidget(
                                      controller: _profilecreatedcontroller,
                                      values: [
                                        "Self",
                                        "Parents",
                                        "Relatives",
                                        "Friends"
                                      ])),
                              const Divider(),
                              const SizedBox(height: 15),

                              //Instagram Link
                              DetailsRowWidget(
                                  label: "Instagram Link",
                                  valueWidget: EditableTextWidget(
                                      controller: _instalinkcontroller)),
                              const Divider(),
                              const SizedBox(height: 15),

                              //Facebook Link
                              DetailsRowWidget(
                                  label: "Facebook Link",
                                  valueWidget: EditableTextWidget(
                                      controller: _fblinkcontroller)),
                              const Divider(),
                              const SizedBox(height: 15),

                              //Linkedln Link
                              DetailsRowWidget(
                                  label: "Linkedln Link",
                                  valueWidget: EditableTextWidget(
                                      controller: _linkedlnlinkcontroller)),
                              const Divider(),
                              const SizedBox(height: 15),

                              //Youtube Link
                              DetailsRowWidget(
                                  label: "Youtube  Link",
                                  valueWidget: EditableTextWidget(
                                    controller: _youtubelinkcontroller,
                                  )),
                              const SizedBox(height: 15),
                              CustomButton(
                                  text: "Save",
                                  onPressed: () async {
                                    updateAdditionalDetails();
                                    await EditProfileService()
                                        .updateAdditionalDetails(
                                            userData:
                                                userController.userData.value,
                                            context: context);
                                  }),
                              const SizedBox(height: 20),
                            ])))
              ]))),
        ]));
  }
}
