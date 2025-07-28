import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/model/dropdown_model.dart';
import 'package:inakal/features/requests/model/request_user_details_model.dart';
import 'package:inakal/features/requests/service/request_service.dart';
import 'package:inakal/features/requests/widgets/send_requests_card.dart';
import 'package:lottie/lottie.dart';

class SendRequests extends StatefulWidget {
  const SendRequests({super.key});

  @override
  State<SendRequests> createState() => _SendRequestsState();
}

class _SendRequestsState extends State<SendRequests> {
  final TextEditingController searchController = TextEditingController();
  List<String> filters = ["All", "Accepted", "Pending"];
  String selectedFilter = "All";
  String searchQuery = "";
  List<RequestUserDetailsModel?> allSentRequests = [];
  List<RequestUserDetailsModel?> filteredUsers = [];
  bool isLoading = true;
  DropdownModel? dropdownModel;
  final userController = Get.find<UserDataController>();

  @override
  void initState() {
    dropdownModel = userController.dropdownModel.value;
    super.initState();
    fetchSentRequests();

    // Add listener to search controller
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text;
        applyFilter();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> deleteRequest(String req_id) async {
    await RequestService().deleteRequest(req_id, context);
  }

  Future<void> fetchSentRequests() async {
    setState(() {
      isLoading = true;
      filteredUsers.clear();
    });

    await RequestService().getSentRequestUserDetails(context).then((value) {
      setState(() {
        allSentRequests = value;
        applyFilter();
        isLoading = false;
      });
    });

    print(allSentRequests.length);
  }

  void applyFilter() {
    // First apply status filter
    List<RequestUserDetailsModel?> statusFilteredUsers;

    if (selectedFilter == "All") {
      statusFilteredUsers = List.from(allSentRequests);
    } else if (selectedFilter == "Accepted") {
      statusFilteredUsers =
          allSentRequests.where((user) => user?.status == "accepted").toList();
    } else if (selectedFilter == "Pending") {
      statusFilteredUsers =
          allSentRequests.where((user) => user?.status == "pending").toList();
    } else {
      statusFilteredUsers = allSentRequests;
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
      applyFilter();
    });
  }

  void clearSearch() {
    searchController.clear();
    // The listener will automatically trigger applyFilter()
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
                        final keyboardHeight =
                            MediaQuery.of(context).viewInsets.bottom;
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
                                        ? MediaQuery.of(context).size.width *
                                            0.4 // Smaller when keyboard is visible
                                        : MediaQuery.of(context).size.width *
                                            0.6,
                                    height: isKeyboardVisible
                                        ? MediaQuery.of(context).size.width *
                                            0.4
                                        : null,
                                  ),
                                  SizedBox(height: isKeyboardVisible ? 8 : 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
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
                      onRefresh: fetchSentRequests,
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          return SendRequestsCard(
                            clientId: user?.clientID ?? "",
                            image: user?.image ?? "",
                            name: user?.firstName != null
                                ? "${user?.firstName} ${user?.lastName}"
                                : "",
                            location: dropdownModel!.states!
                                    .firstWhere((location) =>
                                        location.id == user?.state)
                                    .name ??
                                "State Not Specified",
                            status: user?.status ?? "",
                            role: dropdownModel!.occupations!
                                    .firstWhere(
                                        (occupation) =>
                                            occupation.id == user?.occupation,
                                        orElse: () => ReEdOcLanSt(
                                            name: "Occupation Not Specified"))
                                    .name ??
                                "Occupation Not Specified",
                            age: user?.dob ?? "",
                            height: user?.height ?? "",
                            req_status: user?.status ?? "",
                            religion: dropdownModel!.religions!
                                    .firstWhere(
                                      (religion) =>
                                          religion.id == user?.religion,
                                      orElse: () => ReEdOcLanSt(
                                          name: "Religion Not Specified"),
                                    )
                                    .name ??
                                "Religion Not Specified",
                            // user?.religion ?? "",
                            req_id: user?.requestId ?? "",
                            onTap: () async {
                              await deleteRequest(user?.requestId ?? "");
                              await fetchSentRequests();
                            },
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }
}
