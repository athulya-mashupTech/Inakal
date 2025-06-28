import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/filter_users/widgets/filter_dropdown.dart';

class FilteringScreen extends StatefulWidget {
  const FilteringScreen({super.key});

  @override
  State<FilteringScreen> createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen> {
  TextEditingController religionController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController subcasteController = TextEditingController();
  TextEditingController ageRangeController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController highestEducationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  TextEditingController familyStatusController = TextEditingController();
  TextEditingController foodPreferenceController = TextEditingController();

  DropdownModel? dropdownModel;
  bool _isLoading = true;

  Future<void> _loadDropdownOptions() async {
    await EditProfileService()
        .getDropdownOptions(context: context)
        .then((value) {
      setState(() {
        dropdownModel = value;
      });
    }).then((value) => setState(() {
              _isLoading = false;
            }));
  }

  @override
  void initState() {
    _loadDropdownOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Iconify(Mdi.instant_mix),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Filter")
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              const SizedBox(height: 10),
              _isLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        FilterDropdown(
                          label: "Religion",
                          items: dropdownModel!.religions!
                              .map((item) => item.name ?? "")
                              .toList(),
                          valueController: religionController,
                        ),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Caste",
                            items: dropdownModel!.castes!
                                .map((item) => item.name ?? "")
                                .toList(),
                            valueController: casteController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Sub Caste",
                            items: dropdownModel!.subcastes!
                                .map((item) => item.name ?? "")
                                .toList(),
                            valueController: subcasteController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Age Range",
                            items: [
                              "18-30",
                              "25-35",
                              "30-40",
                              "35-45",
                              "40-50",
                              "45-55",
                              "50-60",
                              "55-65"
                            ],
                            valueController: ageRangeController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Height",
                            items: [
                              '4\'0" - 4\'5" (121-137 cm)',
                              '4\'5" - 4\'10" (137–147 cm)',
                              '5\'4\'10" - 5\'3" (147-160 cm)',
                              '3" - 5\'8" (160-173 cm)',
                              '5\'8" - 6\'1" (173-185 cm)',
                              '6\'1" - 6\'6" (185-198 cm)',
                              '6\'6" - 7\'0" (198-213 cm)'
                            ],
                            valueController: heightController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Weight",
                            items: [
                              "40-50 kg",
                              "50-60 kg",
                              "60-70 kg",
                              "70-80 kg",
                              "80-90 kg",
                              "90-100 kg",
                              "100-110 kg",
                              "110-120 kg"
                            ],
                            valueController: weightController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "State",
                            items: dropdownModel!.states!
                                .map((item) => item.name ?? "")
                                .toList(),
                            valueController: stateController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Language",
                            items: dropdownModel!.languages!
                                .map((item) => item.name ?? "")
                                .toList(),
                            valueController: languageController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Marital Status",
                            items: ["Unmarried", "Divorced", "Widower"],
                            valueController: maritalStatusController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Highest Education",
                            items: dropdownModel!.highestEducations!
                                .map((item) => item.name ?? "")
                                .toList(),
                            valueController: highestEducationController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Occupation",
                            items: dropdownModel!.occupations!
                                .map((item) => item.name ?? "")
                                .toList(),
                            valueController: occupationController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Annual Income",
                            items: [
                              "1 Lakh - 3 Lakh",
                              "3 Lakh - 5 Lakh",
                              "5 Lakh - 7 Lakh",
                              "7 Lakh - 10 Lakh",
                              "10 Lakh - 15 Lakh",
                              "15 Lakh - 20 Lakh",
                              "20 Lakh - 30 Lakh",
                              "30 Lakh - 50 Lakh",
                              "50 Lakh - 75 Lakh",
                              "75 Lakh - 1 Crore",
                              "More than 2 Crores"
                            ],
                            valueController: annualIncomeController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Family Status",
                            items: [
                              "Upper Class",
                              "Middle Class",
                              "Lower Class"
                            ],
                            valueController: familyStatusController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            label: "Food Preferences",
                            items: [
                              "Vegetarian",
                              "Non Vegetarian",
                              "Vegan",
                              "Any"
                            ],
                            valueController: foodPreferenceController),
                        SizedBox(
                          height: 16,
                        ),
                        // CustomButton(
                        //   text: "Reset Filters",
                        //   onPressed: () {},
                        //   color: AppColors.grey,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        CustomButton(
                          text: "Apply Filters",
                          onPressed: () {
                            print(religionController.text);
                            print(casteController.text);
                            print(subcasteController.text);
                            print(ageRangeController.text);
                            print(heightController.text);
                            print(weightController.text);
                            print(stateController.text);
                            print(languageController.text);
                            print(maritalStatusController.text);
                            print(highestEducationController.text);
                            print(occupationController.text);
                            print(annualIncomeController.text);
                            print(familyStatusController.text);
                            print(foodPreferenceController.text);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    ));
  }
}
