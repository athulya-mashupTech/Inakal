import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:inakal/features/chat/widgets/inbox_card.dart';
import 'package:inakal/data_class/user.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<String> filters = ["All Chats", "Matches", "Psychologists"];
  String selectedFilter = "All Chats";
  List<Map<String, String>> allUsers = [
    {
      "name": "Athulya",
      "message": "Hey, how are you>",
      "unread": "5",
      "req_status": "Accepted",
      "time": "12:30 PM",
      "image": "assets/vectors/ath.jpeg",
      "recently_seen": "online",
    },
    {
      "name": "Kalidas",
      "message": "Hey, how are you>",
      "unread": "12",
      "req_status": "Pending",
      "time": "12:30 PM",
      "image": "assets/vectors/kalidas.jpeg",
      "recently_seen": "last seen 10:28",
    },
    {
      "name": "Suriya",
      "message": "Hai sir, how are you>",
      "unread": "0",
      "req_status": "Accepted",
      "time": "11:30 PM",
      "image": "assets/vectors/suriya3.jpg",
      "recently_seen": "online",
    },
    {
      "name": "Harsha Sreekanth",
      "message": "Hey, how are you>",
      "unread": "0",
      "req_status": "Accepted",
      "time": "02:30 PM",
      "image": "assets/vectors/harsha2.jpg",
      "recently_seen": "last seen 10:28",
    },
    {
      "name": "Druv Vikram",
      "message": "Hey, how are you>",
      "unread": "0",
      "req_status": "Pending",
      "time": "12:30 PM",
      "image": "assets/vectors/druv.jpg",
      "recently_seen": "last seen 05:18",
    },
    {
      "name": "Druv Vikram",
      "message": "Hey, how are you>",
      "unread": "0",
      "req_status": "Pending",
      "time": "12:30 PM",
      "image": "assets/vectors/druv.jpg",
      "recently_seen": "last seen 05:18",
    },
    {
      "name": "Druv Vikram",
      "message": "Hey, how are you>",
      "unread": "0",
      "req_status": "Pending",
      "time": "12:30 PM",
      "image": "assets/vectors/druv.jpg",
      "recently_seen": "last seen 05:18",
    },
    {
      "name": "Druv Vikram",
      "message": "Hey, how are you>",
      "unread": "0",
      "req_status": "Pending",
      "time": "12:30 PM",
      "image": "assets/vectors/druv.jpg",
      "recently_seen": "last seen 05:18",
    },
  ];
  List<Map<String, String>> filteredUsers = [];

  void filterUsers(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == "All Chats") {
        filteredUsers = List.from(allUsers); // Show all users
      } else if (filter == "Matches") {
        filteredUsers =
            allUsers.where((user) => user["req_status"] == "Accepted").toList();
      } else if (filter == "Psychologists") {
        filteredUsers =
            allUsers.where((user) => user["req_status"] == "Pending").toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredUsers = allUsers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Recent Chats"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          LightPinkGradient(),
          Positioned(
            bottom: 10,
            left: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14),
              child: Image.asset(
                "assets/vectors/dotted_design3.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            children: [
              // Top Filters of chats
              Container(
                color: AppColors.softPink.withOpacity(0.4),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: filters.map((filter) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ChoiceChip(
                          selectedColor: AppColors.primaryRed,
                          checkmarkColor: AppColors.white,
                          labelStyle: TextStyle(
                              color: selectedFilter == filter
                                  ? AppColors.white
                                  : AppColors.black),
                          label: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(filter),
                          ),
                          selected: selectedFilter == filter,
                          onSelected: (bool selected) {
                            filterUsers(
                                filter); // Apply the filter when the chip is selected
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          return InboxCard(user: filteredUsers[index]);
                        },
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
