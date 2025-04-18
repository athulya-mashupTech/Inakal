import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/requests/model/request_user_details_model.dart';
import 'package:inakal/features/requests/service/request_service.dart';
import 'package:inakal/features/requests/widgets/received_requests_card.dart';
import 'package:inakal/data_class/user.dart';
import 'package:lottie/lottie.dart';

class ReceivedRequests extends StatefulWidget {
  const ReceivedRequests({super.key});

  @override
  State<ReceivedRequests> createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends State<ReceivedRequests> {
  List<String> filters = ["All", "Accepted", "Pending"];
  String selectedFilter = "All";
  List<RequestUserDetailsModel?> allReceivedRequests = [];
  List<RequestUserDetailsModel?> filteredUsers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchReceivedRequests();
  }

  Future<void> fetchReceivedRequests() async {
    await RequestService().getReceivedRequestUserDetails(context).then((value) {
      setState(() {
        allReceivedRequests = value;
        filteredUsers = allReceivedRequests;
        isLoading = false;
      });
    });
    print(allReceivedRequests.length);
  }

  void filterUsers(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == "All") {
        filteredUsers = List.from(allReceivedRequests); // Show all users
      } else if (filter == "Accepted") {
        filteredUsers = allReceivedRequests
            .where((user) => user?.status == "Accepted")
            .toList();
      } else if (filter == "Pending") {
        filteredUsers = allReceivedRequests
            .where((user) => user?.status == "pending")
            .toList();
      }
    });
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
                  filterUsers(
                      filter); // Apply the filter when the chip is selected
                },
              );
            }).toList(),
          ),
        ),
        isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : filteredUsers.isEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/lottie/empty_data.json",
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                          const Text(
                            "No Requests Found",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        return ReceivedRequestsCard(
                          image: filteredUsers[index]?.image ?? "",
                          name: filteredUsers[index]?.firstName != null
                              ? "${filteredUsers[index]?.firstName} ${filteredUsers[index]?.lastName}"
                              : "",
                          location: filteredUsers[index]?.state ?? "",
                          status: filteredUsers[index]?.status ?? "",
                          role: filteredUsers[index]?.occupation ?? "",
                          age: filteredUsers[index]?.dob ?? "",
                          height: filteredUsers[index]?.height ?? "",
                          req_status: filteredUsers[index]?.status ?? "",
                          religion: filteredUsers[index]?.religion ?? "",
                        );
                      },
                    ),
                  ),
      ],
    );
  }
}
