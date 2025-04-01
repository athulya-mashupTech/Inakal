import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient_from_top.dart';
import 'package:inakal/features/drawer/widgets/Edit_profle_dropdown.dart';
import 'package:inakal/features/auth/registration/screens/image_upload_screen.dart';

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
  String selectedMaritalStatus = 'Single';
  String selectedBirthStar = 'Virgo';

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _sNameController = TextEditingController();
  final TextEditingController _phNoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
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
    _phNoController.text = "9876543210";
    _dobController.text = "27/08/2002";

    _occupationController.text = "Software Developer";
    _incomeController.text = "20";
    _locationController.text = "Infopark, Kochi";
    _educationController.text = "MCA";
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
                const SizedBox(height: 14),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Personal Details", textAlign: TextAlign.start),
                ),
                const SizedBox(height: 15),
                Container(
                  color: AppColors.bgsoftpink,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Firstname", textAlign: TextAlign.start),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                controller: _fNameController,
                                textAlign: TextAlign.end,
                                decoration: null,
                                onSubmitted: (value) {
                                  setState(() {
                                    _fNameController.text = value;
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
                            const Text("Secondname",
                                textAlign: TextAlign.start),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextField(
                                controller: _sNameController,
                                textAlign: TextAlign.end,
                                decoration: null,
                                onSubmitted: (value) {
                                  setState(() {
                                    _sNameController.text = value;
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
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Date Of Birth",
                                textAlign: TextAlign.start),
                            Container(
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
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Gender", textAlign: TextAlign.start),
                            DropdownButton<String>(
                              value: selectedGender,
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,
                                color: AppColors.primaryRed,
                                size: 30,
                              ),
                              items: <String>['Male', 'Female', 'Others']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedGender = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Height", textAlign: TextAlign.start),
                            Row(
                              children: [
                                const Text("6’65”ft",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Iconify(
                                          Ic.round_arrow_drop_up,
                                          color: AppColors.primaryRed,
                                          size: 30,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Iconify(
                                          Ic.round_arrow_drop_down,
                                          color: AppColors.primaryRed,
                                          size: 30,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Weight", textAlign: TextAlign.start),
                            Row(
                              children: [
                                const Text("60Kg",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Iconify(
                                          Ic.round_arrow_drop_up,
                                          color: AppColors.primaryRed,
                                          size: 30,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Iconify(
                                          Ic.round_arrow_drop_down,
                                          color: AppColors.primaryRed,
                                          size: 30,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Religion", textAlign: TextAlign.start),
                            DropdownButton<String>(
                              value: selectedReligion,
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,
                                color: AppColors.primaryRed,
                                size: 30,
                              ),
                              items: <String>[
                                'Hindu',
                                'Muslim',
                                'Christian',
                                'Buddhist'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedReligion = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Caste", textAlign: TextAlign.start),
                            DropdownButton<String>(
                              value: selectedCaste,
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,
                                color: AppColors.primaryRed,
                                size: 30,
                              ),
                              items: <String>['Nair', 'Ezhava', 'LC', 'RC']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedCaste = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Mother Tongue",
                                textAlign: TextAlign.start),
                            DropdownButton<String>(
                              value: selectedMotherTongue,
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,
                                color: AppColors.primaryRed,
                                size: 30,
                              ),
                              items: <String>[
                                'Malayalam',
                                'Tamil',
                                'Hindi',
                                'Telugu'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedMotherTongue = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Marital Status",
                                textAlign: TextAlign.start),
                            DropdownButton<String>(
                              value: selectedMaritalStatus,
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,
                                color: AppColors.primaryRed,
                                size: 30,
                              ),
                              items: <String>[
                                'Single',
                                'Divorced',
                                'Widowed',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedMaritalStatus = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Birth Star",
                                textAlign: TextAlign.start),
                            DropdownButton<String>(
                              value: selectedBirthStar,
                              icon: const Iconify(
                                Ic.round_arrow_drop_down,
                                color: AppColors.primaryRed,
                                size: 30,
                              ),
                              items: <String>[
                                'Capricon',
                                'Virgo',
                                'Cancer',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedBirthStar = newValue;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
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
              ]))),
        ]));
  }
}
