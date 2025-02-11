import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/widgets/Edit_profle_dropdown.dart';
import 'package:inakal/features/registration/widgets/dropdown_feild.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String selectedWeight = '60Kg';
  String selectedReligion = 'Hindu';
  String selectedCaste = 'Nair';
  String selectedMotherTongue = 'Malayalam';
  String selectedMaritalStatus = 'Single';
  String selectedBirthStar = 'Virgo';
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(color: AppColors.primaryRed, fontSize: 16),
                ),
                SizedBox(height: 15),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/vectors/harsha1.jpg"),
                  radius: 80,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Text("Personal Details", textAlign: TextAlign.start),
          const SizedBox(height: 15),
          Container(
            color: AppColors.bgsoftpink,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Firstname", textAlign: TextAlign.start),
                      Text(
                        "Harsha",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Secondname", textAlign: TextAlign.start),
                      Text("Sreekanth",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date Of Birth", textAlign: TextAlign.start),
                      Text("21/12/2025",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gender", textAlign: TextAlign.start),
                      Text("female",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                            child: Text(value),
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
                            child: Text(value),
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
                      const Text("Mother Tongue", textAlign: TextAlign.start),
                      DropdownButton<String>(
                        value: selectedMotherTongue,
                        icon: const Iconify(
                          Ic.round_arrow_drop_down,
                          color: AppColors.primaryRed,
                          size: 30,
                        ),
                        items: <String>['Malayalam', 'Tamil', 'Hindi', 'Telugu']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
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
                      const Text("Marital Status", textAlign: TextAlign.start),
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
                            child: Text(value),
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
                      const Text("Birth Star", textAlign: TextAlign.start),
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
                            child: Text(value),
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
          const Text("Living Address", textAlign: TextAlign.start),
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
          const Text("Professional & Educational Details",
              textAlign: TextAlign.start),
          const SizedBox(height: 20),
          Container(
            color: AppColors.bgsoftpink,
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Occupation", textAlign: TextAlign.start),
                      Text("Software Developer",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Work Location", textAlign: TextAlign.start),
                      Text("Infopark,Kochi",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Annual Income", textAlign: TextAlign.start),
                      Text("20LPA",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Highest Education", textAlign: TextAlign.start),
                      Text("MCA",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]))));
  }
}
