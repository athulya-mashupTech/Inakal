import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/profile/widgets/other_profile_detail_card.dart';
import 'package:inakal/features/requests/widgets/accept_button.dart';
import 'package:inakal/features/requests/widgets/decline_button.dart';
import 'package:inakal/features/requests/widgets/message_button.dart';
import 'package:inakal/model/user.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({super.key});

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  User userData = User.getUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // userData = User.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(userData.name),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.white,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      gradient: AppColors.lightPinkWhiteGradient,
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(20), // Adjust the radius as needed
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage(userData.image),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      fit:
                          BoxFit.cover, // Adjust to BoxFit.contain if necessary
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(userData.name,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 5),
                            const Text("|",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey)),
                            const SizedBox(width: 5),
                            Text(userData.location,
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text("INK3929",
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 5),
                            const Text("|",
                                style: TextStyle(
                                    fontSize: 24, color: AppColors.grey)),
                            const SizedBox(width: 5),
                            const Text("Last seen today at 11:11am",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text("Male", style: TextStyle(fontSize: 16)),
                            const SizedBox(width: 5),
                            const Text("|",
                                style: TextStyle(
                                    fontSize: 24, color: AppColors.grey)),
                            const SizedBox(width: 5),
                            Text("${userData.height}, ${userData.weight} Kg",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                            userData.description,
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Personal Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OtherProfileDetailCard(
                                      title: "Height", value: userData.height),
                                  OtherProfileDetailCard(
                                      title: "Religion", value: userData.religion),
                                  const OtherProfileDetailCard(
                                      title: "Mother Tongue", value: "Tamil"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OtherProfileDetailCard(
                                      title: "Weight", value: userData.weight),
                                  const OtherProfileDetailCard(
                                      title: "Caste", value: "Nair"),
                                  OtherProfileDetailCard(
                                      title: "Marital Status", value: userData.status),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        const Text("Educational Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const OtherProfileDetailCard(
                                  title: "Qualification",
                                  value: "MSc Computer Science"),
                              OtherProfileDetailCard(
                                  title: "Job",
                                  value: userData.role),
                              const OtherProfileDetailCard(
                                  title: "Income", value: "33 LPA"),
                              const OtherProfileDetailCard(
                                  title: "Working Location",
                                  value: "Infopark, Kochi"),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        const Text("Additional Details",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const OtherProfileDetailCard(
                                  title: "Smoking Habit", value: "No"),
                              const OtherProfileDetailCard(
                                  title: "Drinking Habit", value: "Yes"),
                              const OtherProfileDetailCard(
                                  title: "Profile created by", value: "Sister"),
                              const OtherProfileDetailCard(
                                  title: "Hobbies",
                                  value: "Reading, Painting, Singing"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  userData.req_status == "Accepted" 
                    ? MessageButton(text: "Message")
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DeclineButton(text: "Decline"),
                          AcceptButton(text: "Accept")
                        ],
                      ),
                    ),

                  SizedBox(
                    height: 40,
                  )
                ]),
              ],
            ),
          ),
        ));
  }
}
