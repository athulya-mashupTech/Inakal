import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/filter_users/model/applied_filters_model.dart';
import 'package:inakal/features/filter_users/model/filter_model.dart';
import 'package:inakal/features/filter_users/services/filter_profile_service.dart';
import 'package:inakal/features/home/widgets/user_card.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';
import 'package:lottie/lottie.dart';

class FilteredProfileScreen extends StatefulWidget {
  final FilterProfileModel responseModel;
  final AppliedFiltersModel appliedFiltersModel;

  const FilteredProfileScreen(this.responseModel, this.appliedFiltersModel,
      {super.key});

  @override
  State<FilteredProfileScreen> createState() => _FilteredProfileScreenState();
}

class _FilteredProfileScreenState extends State<FilteredProfileScreen> {
  int count = 0;
  bool isLoading = false;
  final userController = Get.find<UserDataController>();
  DropdownModel? dropdownModel;
  late FilterProfileModel filterResponseModel;
  late List<Clients> filteredProfiles;

  @override
  void initState() {
    dropdownModel = userController.dropdownModel.value;
    filterResponseModel = widget.responseModel;
    filteredProfiles = widget.responseModel.clients ?? [];
    super.initState();
  }

  String getLocation(String district, String state) {
    if (district != "" && state != "") {
      return "$district, $state";
    } else if (district == "" && state != "") {
      return state;
    } else if (district != "" && state == "") {
      return district;
    }
    return "";
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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Iconify(Mdi.instant_mix),
                          SizedBox(width: 3),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Filtered ',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Profiles',
                                  style: TextStyle(
                                    color: AppColors.primaryRed,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                          "Showing profiles out of ${widget.responseModel.totalRows ?? "0"} matches"),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (widget.appliedFiltersModel.filterReligion
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(
                                widget.appliedFiltersModel.filterReligion),
                          if (widget.appliedFiltersModel.filterCaste.isNotEmpty)
                            ...widget.appliedFiltersModel.filterCaste
                                .where((e) => e.trim().isNotEmpty)
                                .map(_buildFilterChip),
                          if (widget.appliedFiltersModel.filterSubCaste.isNotEmpty)
                            ...widget.appliedFiltersModel.filterSubCaste
                                .where((e) => e.trim().isNotEmpty)
                                .map(_buildFilterChip),
                          if (widget.appliedFiltersModel.filterAgeGroup
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(
                                widget.appliedFiltersModel.filterAgeGroup),
                          if (widget.appliedFiltersModel.filterHeight
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(widget.appliedFiltersModel.filterHeight),
                          if (widget.appliedFiltersModel.filterWeight
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(widget.appliedFiltersModel.filterWeight),
                          if (widget.appliedFiltersModel.filterState.trim().isNotEmpty)
                            _buildFilterChip(widget.appliedFiltersModel.filterState),
                          if (widget.appliedFiltersModel.filterMotherTongue
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(
                                widget.appliedFiltersModel.filterMotherTongue),
                          if (widget.appliedFiltersModel.filterMaritalStatus
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(
                                widget.appliedFiltersModel.filterMaritalStatus),
                          if (widget.appliedFiltersModel.filterEducation
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(
                                widget.appliedFiltersModel.filterEducation),
                          if (widget.appliedFiltersModel.filterOccupation.isNotEmpty)
                            ...widget.appliedFiltersModel.filterOccupation
                                .where((e) => e.trim().isNotEmpty)
                                .map(_buildFilterChip),
                          if (widget.appliedFiltersModel.filterAnnualIncome
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(
                                widget.appliedFiltersModel.filterAnnualIncome),
                          if (widget.appliedFiltersModel.filterFoodPreference
                              .trim()
                              .isNotEmpty)
                            _buildFilterChip(
                                widget.appliedFiltersModel.filterFoodPreference),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                (widget.responseModel.totalRows ?? "0") == "0"
                    ? Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                "assets/lottie/empty_data.json",
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "No Matches Found",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10, // Spacing between columns
                              mainAxisSpacing: 10, // Spacing between rows
                              childAspectRatio: 1,
                            ),
                            itemCount: filteredProfiles.length,
                            itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OtherProfileScreen(
                                                    id: filteredProfiles[index]
                                                        .id!)));
                                  },
                                  child: UserCard(
                                      name:
                                          "${filteredProfiles[index].firstName} ${filteredProfiles[index].lastName}",
                                      location: getLocation(
                                          filteredProfiles[index].district == null ||
                                                  filteredProfiles[index]
                                                          .district ==
                                                      ""
                                              ? ""
                                              : dropdownModel!.districts!.firstWhere((dist) => dist.id == filteredProfiles[index].district).name ??
                                                  "",
                                          filteredProfiles[index].state == null ||
                                                  filteredProfiles[index].state ==
                                                      ""
                                              ? ""
                                              : dropdownModel!.states!.firstWhere((state) => state.id == filteredProfiles[index].state).name ??
                                                  ""),
                                      dob: filteredProfiles[index].dob ??
                                          "0000-00-00",
                                      image: filteredProfiles[index].image ==
                                              "https://etutor.s3.ap-south-1.amazonaws.com/users/avatar.png"
                                          ? "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg"
                                          : "${filteredProfiles[index].image}",
                                      likedBy: filteredProfiles[index].liked ??
                                          false,
                                      clientId: filteredProfiles[index].id ?? ""),
                                )),
                      ),
                SizedBox(height: 15),
                isLoading
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : filterResponseModel.hasMore == true
                        ? CustomButton(
                            text: "Load More Profiles",
                            // icon: Icons.keyboard_arrow_down_rounded,
                            onPressed: () async {
                              if (widget.responseModel.hasMore == true) {
                                setState(() {
                                  count++;
                                  isLoading = true;
                                });
                                await FilterProfileService()
                                    .getfilteredProfiles(context, count,
                                        widget.appliedFiltersModel)
                                    .then((value) {
                                  setState(() {
                                    if (value != null) {
                                      filterResponseModel = value;
                                      filteredProfiles
                                          .addAll(value.clients ?? []);
                                    }
                                    isLoading = false;
                                  });
                                });
                              }
                            },
                          )
                        : SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildFilterChip(String label) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.primaryRed,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: AppColors.white)),
          const SizedBox(width: 5),
          // GestureDetector(
          //   onTap: () {
          //     // Handle chip removal if needed
          //   },
          //   child: const Icon(Icons.close, size: 18, color: AppColors.white),
          // )
        ],
      ),
    ),
  );
}
