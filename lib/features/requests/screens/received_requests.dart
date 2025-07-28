import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/requests/model/request_user_details_model.dart';
import 'package:inakal/features/requests/service/request_service.dart';
import 'package:inakal/features/requests/widgets/received_requests_card.dart';
import 'package:lottie/lottie.dart';

class ReceivedRequests extends StatefulWidget {
  const ReceivedRequests({super.key});

  @override
  State<ReceivedRequests> createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends State<ReceivedRequests> {
  final TextEditingController searchController = TextEditingController();
  List<String> filters = ["All", "Accepted", "Pending"];
  String selectedFilter = "All";
  String searchQuery = "";
  List<RequestUserDetailsModel?> allReceivedRequests = [];
  List<RequestUserDetailsModel?> filteredUsers = [];
  bool isLoading = true;
  final userController = Get.find<UserDataController>();
  DropdownModel? dropdownModel;

  @override
  void initState() {
    super.initState();
    dropdownModel = userController.dropdownModel.value;
    fetchReceivedRequests();
    
    // Add listener to search controller
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text;
        applyFilters();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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

  Future<void> fetchReceivedRequests() async {
    setState(() {
      isLoading = true;
      filteredUsers.clear();
    });

    await RequestService().getReceivedRequestUserDetails(context).then((value) {
      setState(() {
        allReceivedRequests = value;
        applyFilters();
        isLoading = false;
      });
    });
  }

  void applyFilters() {
    // First apply status filter
    List<RequestUserDetailsModel?> statusFilteredUsers;
    
    if (selectedFilter == "All") {
      statusFilteredUsers = allReceivedRequests
          .where(
              (user) => user?.status == "accepted" || user?.status == "pending")
          .toList();
    } else if (selectedFilter == "Accepted") {
      statusFilteredUsers = allReceivedRequests
          .where((user) => user?.status == "accepted")
          .toList();
    } else if (selectedFilter == "Pending") {
      statusFilteredUsers = allReceivedRequests
          .where((user) => user?.status == "pending")
          .toList();
    } else {
      statusFilteredUsers = allReceivedRequests;
    }

    // Then apply search filter
    if (searchQuery.isEmpty) {
      filteredUsers = statusFilteredUsers;
    } else {
      filteredUsers = statusFilteredUsers.where((user) {
        if (user == null) return false;
        
        final firstName = user.firstName?.toLowerCase() ?? "";
        final lastName = user.lastName?.toLowerCase() ?? "";
        final fullName = "$firstName $lastName".trim();
        final query = searchQuery.toLowerCase();
        
        return firstName.contains(query) || 
               lastName.contains(query) || 
               fullName.contains(query);
      }).toList();
    }
  }

  void filterUsers(String filter) {
    setState(() {
      selectedFilter = filter;
      applyFilters();
    });
  }

  void clearSearch() {
    searchController.clear();
    // The listener will automatically trigger applyFilters()
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: filters.map((filter) {
              return ChoiceChip(
                selectedColor: AppColors.primaryRed,
                checkmarkColor: AppColors.white,
                labelStyle: TextStyle(
                    color: selectedFilter == filter
                        ? AppColors.white
                        : AppColors.black),
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(filter),
                ),
                selected: selectedFilter == filter,
                onSelected: (bool selected) {
                  filterUsers(filter);
                },
              );
            }).toList(),
          ),
        ),

        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search by Name",
              prefixIcon: Icon(Icons.search),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: clearSearch,
                      icon: Icon(Icons.close))
                  : null,
              fillColor: AppColors.white,
              labelStyle: TextStyle(color: AppColors.grey, fontSize: 14),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.primaryRed),
              ),
            ),
          ),
        ),

        Expanded(
          child: isLoading && filteredUsers.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : filteredUsers.isEmpty
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        // Get keyboard height
                        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
                        final isKeyboardVisible = keyboardHeight > 0;
                        
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    "assets/lottie/empty_data.json",
                                    width: isKeyboardVisible 
                                        ? MediaQuery.of(context).size.width * 0.4  // Smaller when keyboard is visible
                                        : MediaQuery.of(context).size.width * 0.6,
                                    height: isKeyboardVisible 
                                        ? MediaQuery.of(context).size.width * 0.4
                                        : null,
                                  ),
                                  SizedBox(height: isKeyboardVisible ? 8 : 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      searchQuery.isNotEmpty 
                                          ? "No results found for '$searchQuery'"
                                          : "No Requests Found",
                                      style: TextStyle(
                                        fontSize: isKeyboardVisible ? 16 : 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : RefreshIndicator(
                      onRefresh: fetchReceivedRequests,
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          return ReceivedRequestsCard(
                            client_id: user?.clientID ?? "",
                            image: user?.image ??
                                "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg",
                            name: user?.firstName != null
                                ? "${user?.firstName} ${user?.lastName}"
                                : "Not Specified",
                            location: getLocation(
                                user?.district == null || user?.district == ""
                                    ? ""
                                    : dropdownModel!.districts!
                                            .firstWhere((dist) =>
                                                dist.id == user?.district, orElse: () => Districts(name: ""),)
                                            .name ??
                                        "",
                                user?.state == null || user?.state == ""
                                    ? ""
                                    : dropdownModel!.states!
                                            .firstWhere((state) =>
                                                state.id == user?.state, orElse: () => ReEdOcLanSt(name: ""),)
                                            .name ??
                                        ""),
                            status: user?.status ?? "",
                            role: dropdownModel!.occupations!
                                    .firstWhere(
                                      (occupation) =>
                                          occupation.id == user?.occupation,
                                      orElse: () => ReEdOcLanSt(
                                          id: '',
                                          name: 'Occupation Not Specified'),
                                    )
                                    .name ??
                                "Occupation Not Specified",
                            age: user?.dob ?? "",
                            gender: user?.gender ?? "",
                            height: user?.height ?? "",
                            req_id: user?.requestId ?? "",
                            req_status: user?.status ?? "",
                            religion: dropdownModel!.religions!
                                    .firstWhere(
                                      (religion) =>
                                          religion.id == user?.religion,
                                      orElse: () => ReEdOcLanSt(
                                          id: '', name: 'Not Specified'),
                                    )
                                    .name ??
                                "Not Specified",
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }
}