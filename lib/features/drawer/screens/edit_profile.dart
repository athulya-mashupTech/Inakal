import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/widgets/Edit_profle_dropdown.dart';

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

  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _sNameController = TextEditingController();
  final TextEditingController _phNoController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fNameController.text = "Harsha";
    _sNameController.text = "Sreekanth";
    _phNoController.text = "9876543210";
  }

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
                SizedBox(height: 15),
                Text(
                  "Edit Profile",
                  style: TextStyle(color: AppColors.black, fontSize: 20),
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
                      const Text("Secondname", textAlign: TextAlign.start),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date Of Birth", textAlign: TextAlign.start),
                      Text("21/12/2025",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
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
                      const Text("Height", textAlign: TextAlign.start),
                      Row(
                        children: [
                          const Text("6’65”ft",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
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
                                  fontWeight: FontWeight.bold, fontSize: 18)),
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
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                                    fontWeight: FontWeight.bold, fontSize: 18)),
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
                            child: Text(value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
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
                            child: Text(value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
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
                            child: Text(value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]))));
  }
}
