import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:inakal/constants/app_constants.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
            child: SafeArea(
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
                          style: TextStyle(
                              color: AppColors.primaryRed, fontSize: 16),
                        ),
                        SizedBox(height: 15),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/vectors/harsha1.jpg"),
                          radius: 80,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text("Personal Details", textAlign: TextAlign.start),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Firstname", textAlign: TextAlign.start),
                      Text("Harsha", textAlign: TextAlign.end),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Secondname", textAlign: TextAlign.start),
                      Text("Sreekanth", textAlign: TextAlign.end),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phone Number", textAlign: TextAlign.start),
                      Text("9876543210", textAlign: TextAlign.end),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date Of Birth", textAlign: TextAlign.start),
                      Text("21/12/2025", textAlign: TextAlign.end),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gender", textAlign: TextAlign.start),
                      Text("female", textAlign: TextAlign.end),
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
                          const Text("6’65”ft", textAlign: TextAlign.end),
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
                          const Text("60Kg", textAlign: TextAlign.end),
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
                        items: <String>['Single', 'Divorced', 'Widowed',]
                            .map((String value) {
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
                        items: <String>['Capricon', 'Virgo', 'Cancer',]
                            .map((String value) {
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
                  const Divider(),
                  const Text("Living Address", textAlign: TextAlign.start),
                  const SizedBox(height: 20,),
                  DropdownWidget(
                    label: "Country", 
                    items:  const [
                                'India',
                                'Pakistan',
                                'Australia',
                                'London',
                                'Canada',
                                'Germany',
                                'Austria',
                                'others'
                              ],
                    controller: _countryController
                    )
                ])))));
  }
}
