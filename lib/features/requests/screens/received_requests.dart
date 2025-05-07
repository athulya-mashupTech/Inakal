import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
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
    setState(() {
      isLoading = true;
      filteredUsers.clear();
    });

    await RequestService().getReceivedRequestUserDetails(context).then((value) {
      setState(() {
        allReceivedRequests = value;
        applyFilter();
        isLoading = false;
      });
    });
  }

  void applyFilter() {
    if (selectedFilter == "All") {
      filteredUsers = allReceivedRequests
          .where((user) => user?.status == "accepted" || user?.status == "pending")
          .toList();
    } else if (selectedFilter == "Accepted") {
      filteredUsers = allReceivedRequests
          .where((user) => user?.status == "accepted")
          .toList();
    } else if (selectedFilter == "Pending") {
      filteredUsers = allReceivedRequests
          .where((user) => user?.status == "pending")
          .toList();
    }
  }

  void filterUsers(String filter) {
    setState(() {
      selectedFilter = filter;
      applyFilter();
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
                  filterUsers(filter);
                },
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: isLoading && filteredUsers.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : filteredUsers.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/lottie/empty_data.json",
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                          const Text(
                            "No Requests Found",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: fetchReceivedRequests,
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          return ReceivedRequestsCard(
                            client_id: user?.clientID ?? "",
                            image: user?.image ?? "",
                            name: user?.firstName != null
                                ? "${user?.firstName} ${user?.lastName}"
                                : "",
                            location: user?.state ?? "",
                            status: user?.status ?? "",
                            role: user?.occupation ?? "",
                            age: user?.dob ?? "",
                            height: user?.height ?? "",
                            req_id: user?.requestId ?? "",
                            req_status: user?.status ?? "",
                            religion: user?.religion ?? "",
                          );
                        },
                      ),
                    ),
        ),
      ],
    );
  }
}
