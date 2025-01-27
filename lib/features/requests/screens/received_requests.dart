import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/requests/widgets/received_requests_card.dart';
import 'package:inakal/model/user.dart';

class ReceivedRequests extends StatefulWidget {
  const ReceivedRequests({super.key});

  @override
  State<ReceivedRequests> createState() => _ReceivedRequestsState();
}

class _ReceivedRequestsState extends State<ReceivedRequests> {
  List<String> filters = ["All", "Accepted", "Pending"];
  String selectedFilter = "All";
  List<User> allUsers = [];
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    allUsers = User.getReceivedReqUsers(); // Populate with sample data
    filteredUsers = List.from(allUsers); // Initially, show all users
  }

  void filterUsers(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == "All") {
        filteredUsers = List.from(allUsers); // Show all users
      } else if (filter == "Accepted") {
        filteredUsers = allUsers.where((user) => user.req_status == "Accepted").toList();
      } else if (filter == "Pending") {
        filteredUsers = allUsers.where((user) => user.req_status == "Pending").toList();
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
                  filterUsers(filter); // Apply the filter when the chip is selected
                },
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredUsers.length,
            itemBuilder: (context, index) {
              return ReceivedRequestsCard(
                image: filteredUsers[index].image,
                name: filteredUsers[index].name,
                location: filteredUsers[index].location,
                status: filteredUsers[index].status,
                role: filteredUsers[index].role,
                age: filteredUsers[index].age,
                height: filteredUsers[index].height,
                req_status: filteredUsers[index].req_status,
                religion: filteredUsers[index].religion,
              );
            },
          ),
        ),
      ],
    );
  }
}
