import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/features/drawer/model/caste_subcaste_options_model.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/drawer/service/edit_profile_service.dart';
import 'package:inakal/features/filter_users/model/applied_filters_model.dart';
import 'package:inakal/features/filter_users/screens/filtered_profile_screen.dart';
import 'package:inakal/features/filter_users/services/filter_profile_service.dart';
import 'package:inakal/features/filter_users/widgets/filter_dropdown.dart';
import 'package:inakal/features/filter_users/widgets/filter_multiselector.dart';

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
  int? expandedFilterIndex;
  bool religionSelected = true;

  CasteSubcasteOptionsModel casteSubcasteOptions =
      CasteSubcasteOptionsModel(castes: [], subcastes: []);

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
    religionController.addListener(() {
      if (religionController.text == "") {
        setState(() {
          religionSelected = false;
        });
      } else {
        setState(() {
          religionSelected = true;
        });
      }
    });
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
                          onSelected: (value) async {
                            setState(() {
                              casteController.text = "";
                              subcasteController.text = "";
                              casteSubcasteOptions = CasteSubcasteOptionsModel(
                                  castes: [], subcastes: []);
                            });
                            await FilterProfileService()
                                .getCasteSubcasteOptions(
                                    context,
                                    (dropdownModel!.religions ?? [])
                                            .firstWhere(
                                              (religion) =>
                                                  religion.name == value,
                                              orElse: () => ReEdOcLanSt(id: ""),
                                            )
                                            .id ??
                                        "")
                                .then((options) {
                              print(options.castes?.length);
                              debugPrint(options.castes?.length.toString());
                              setState(() {
                                casteSubcasteOptions = options;
                              });
                            });
                          },
                          onTap: () {
                            setState(() {
                              expandedFilterIndex =
                                  expandedFilterIndex == 0 ? null : 0;
                            });
                          },
                          isExpanded: expandedFilterIndex == 0,
                        ),
                        const SizedBox(height: 10),
                        FilterMultiselectorDropdown(
                            label: "Caste",
                            items: (casteSubcasteOptions.castes ?? [])
                                .map((item) => item.name ?? "")
                                .toList(),
                            valueController: casteController,
                            religionSelected: religionSelected,
                            onTap: () {
                              if (expandedFilterIndex != 11) {
                                if (religionController.text == "")
                                  setState(() {
                                    religionSelected = false;
                                  });
                              } else {
                                setState(() {
                                  religionSelected = true;
                                });
                              }
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 11 ? null : 11;
                              });
                            },
                            isExpanded: expandedFilterIndex == 11),
                        const SizedBox(height: 10),
                        FilterMultiselectorDropdown(
                          label: "Sub Caste",
                          items: (casteSubcasteOptions.subcastes ?? [])
                              .map((item) => item.name ?? "")
                              .toList(),
                          valueController: subcasteController,
                          religionSelected: religionSelected,
                          onTap: () {
                            if (expandedFilterIndex != 11) {
                              if (religionController.text == "")
                                setState(() {
                                  religionSelected = false;
                                });
                            } else {
                              setState(() {
                                religionSelected = true;
                              });
                            }
                            setState(() {
                              expandedFilterIndex =
                                  expandedFilterIndex == 1 ? null : 1;
                            });
                          },
                          isExpanded: expandedFilterIndex == 1,
                        ),
                        const SizedBox(height: 10),
                        FilterDropdown(
                          onSelected: (_) {},
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
                          valueController: ageRangeController,
                          onTap: () {
                            setState(() {
                              expandedFilterIndex =
                                  expandedFilterIndex == 2 ? null : 2;
                            });
                          },
                          isExpanded: expandedFilterIndex == 2,
                        ),
                        const SizedBox(height: 10),
                        FilterDropdown(
                          onSelected: (_) {},
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
                          valueController: heightController,
                          onTap: () {
                            setState(() {
                              expandedFilterIndex =
                                  expandedFilterIndex == 3 ? null : 3;
                            });
                          },
                          isExpanded: expandedFilterIndex == 3,
                        ),
                        const SizedBox(height: 10),
                        FilterDropdown(
                          onSelected: (_) {},
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
                          valueController: weightController,
                          onTap: () {
                            setState(() {
                              expandedFilterIndex =
                                  expandedFilterIndex == 4 ? null : 4;
                            });
                          },
                          isExpanded: expandedFilterIndex == 4,
                        ),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            onSelected: (_) {},
                            label: "State",
                            items: dropdownModel!.states!
                                .map((item) => item.name ?? "")
                                .toList(),
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 5 ? null : 5;
                              });
                            },
                            isExpanded: expandedFilterIndex == 5,
                            valueController: stateController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            onSelected: (_) {},
                            label: "Language",
                            items: dropdownModel!.languages!
                                .map((item) => item.name ?? "")
                                .toList(),
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 6 ? null : 6;
                              });
                            },
                            isExpanded: expandedFilterIndex == 6,
                            valueController: languageController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            onSelected: (_) {},
                            label: "Marital Status",
                            items: ["Unmarried", "Divorced", "Widower"],
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 7 ? null : 7;
                              });
                            },
                            isExpanded: expandedFilterIndex == 7,
                            valueController: maritalStatusController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            onSelected: (_) {},
                            label: "Highest Education",
                            items: dropdownModel!.highestEducations!
                                .map((item) => item.name ?? "")
                                .toList(),
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 8 ? null : 8;
                              });
                            },
                            isExpanded: expandedFilterIndex == 8,
                            valueController: highestEducationController),
                        const SizedBox(height: 10),
                        FilterMultiselectorDropdown(
                            label: "Occupation",
                            items: dropdownModel!.occupations!
                                .map((item) => item.name ?? "")
                                .toList(),
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 9 ? null : 9;
                              });
                            },
                            religionSelected: true,
                            isExpanded: expandedFilterIndex == 9,
                            valueController: occupationController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            onSelected: (_) {},
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
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 10 ? null : 10;
                              });
                            },
                            isExpanded: expandedFilterIndex == 10,
                            valueController: annualIncomeController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            onSelected: (_) {},
                            label: "Family Status",
                            items: [
                              "Upper Class",
                              "Middle Class",
                              "Lower Class"
                            ],
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 11 ? null : 11;
                              });
                            },
                            isExpanded: expandedFilterIndex == 11,
                            valueController: familyStatusController),
                        const SizedBox(height: 10),
                        FilterDropdown(
                            onSelected: (_) {},
                            label: "Food Preferences",
                            items: [
                              "Vegetarian",
                              "Non Vegetarian",
                              "Vegan",
                              "Any"
                            ],
                            onTap: () {
                              setState(() {
                                expandedFilterIndex =
                                    expandedFilterIndex == 12 ? null : 12;
                              });
                            },
                            isExpanded: expandedFilterIndex == 12,
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
                            onPressed: () async {
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
                              final appliedFilters = AppliedFiltersModel(
                                  filterReligion: religionController.text,
                                  filterCaste: casteController.text == ""
                                      ? []
                                      : casteController.text
                                          .split(", ")
                                          .map((caste) =>
                                              (casteSubcasteOptions.castes ?? [])
                                                  .firstWhere((option) => option.name == caste,
                                                      orElse: () =>
                                                          Castes(id: ""))
                                                  .id ??
                                              "")
                                          .toList(),
                                  filterSubCaste: subcasteController.text == ""
                                      ? []
                                      : subcasteController.text
                                          .split(", ")
                                          .map((subcaste) =>
                                              (casteSubcasteOptions.subcastes ?? [])
                                                  .firstWhere(
                                                      (option) => option.name == subcaste,
                                                      orElse: () => Subcastes(id: ""))
                                                  .id ??
                                              "")
                                          .toList(),
                                  filterAgeGroup: ageRangeController.text,
                                  filterHeight: heightController.text,
                                  filterWeight: weightController.text,
                                  filterState: stateController.text,
                                  filterMotherTongue: languageController.text,
                                  filterMaritalStatus: maritalStatusController.text,
                                  filterEducation: highestEducationController.text,
                                  filterOccupation: occupationController.text == ""
                                      ? []
                                      : occupationController.text
                                          .split(", ")
                                          .map((occupation) =>
                                              ((dropdownModel ?? DropdownModel()).occupations ?? [])
                                                  .firstWhere((option) => option.name == occupation,
                                                      orElse: () =>
                                                          ReEdOcLanSt(id: ""))
                                                  .id ??
                                              "")
                                          .toList(),
                                  filterAnnualIncome: annualIncomeController.text,
                                  filterFoodPreference: foodPreferenceController.text);
                              print("object");

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FilteredProfileScreen(
                                              appliedFilters)));
                            }),
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
