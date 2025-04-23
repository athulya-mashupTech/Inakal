import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
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
  List<String> filters = ["All", "Accepted", "Pending"];
  String selectedFilter = "All";
  List<RequestUserDetailsModel?> allSentRequests = [];
  List<RequestUserDetailsModel?> filteredUsers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSentRequests();
  }

  Future<void> deleteRequest(String req_id) async {
    await RequestService().deleteRequest(req_id, context);
  }

  Future<void> fetchSentRequests() async {
    setState(() {
      isLoading = true;
    });
    await RequestService().getSentRequestUserDetails(context).then((value) {
      setState(() {
        allSentRequests = value;
        filteredUsers = allSentRequests;
        isLoading = false;
      });
    });
    print(allSentRequests.length);
  }

  void filterUsers(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == "All") {
        filteredUsers = List.from(allSentRequests); // Show all users
      } else if (filter == "Accepted") {
        filteredUsers = allSentRequests
            .where((user) => user?.status == "Accepted")
            .toList();
      } else if (filter == "Pending") {
        filteredUsers =
            allSentRequests.where((user) => user?.status == "pending").toList();
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
                        return SendRequestsCard(
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
                          req_id: filteredUsers[index]?.requestId ?? "",
                          onTap: () async {
                            await deleteRequest(
                                filteredUsers[index]?.requestId ?? "");
                            await fetchSentRequests();
                          },
                        );
                      },
                    ),
                  ),
      ],
    );
  }
}
