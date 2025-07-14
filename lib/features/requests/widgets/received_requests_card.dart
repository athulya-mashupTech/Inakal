import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';
import 'package:inakal/features/requests/service/request_service.dart';
import 'package:inakal/features/requests/widgets/accept_button.dart';
import 'package:inakal/features/requests/widgets/decline_button.dart';
import 'package:inakal/features/requests/widgets/message_button.dart';
import 'package:shimmer/shimmer.dart';

class ReceivedRequestsCard extends StatefulWidget {
  final String client_id;
  final String req_id;
  final String image;
  final String name;
  final String location;
  final String status;
  final String age;
  final String height;
  final String religion;
  final String role;
  String req_status;

  ReceivedRequestsCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.status,
    required this.role,
    required this.age,
    required this.height,
    required this.req_status,
    required this.religion,
    required this.client_id,
    required this.req_id,
  });

  @override
  State<ReceivedRequestsCard> createState() => _ReceivedRequestsCardState();
}

class _ReceivedRequestsCardState extends State<ReceivedRequestsCard> {
  String calculateAge(String birthDateString) {
    if (birthDateString == "0000-00-00") {
      return "Age Not Specified";
    } else {
      DateTime birthDate = DateTime.parse(birthDateString);
      DateTime today = DateTime.now();

      int age = today.year - birthDate.year;

      // Check if the birthday has occurred yet this year
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      return "$age years";
    }
  }

  Future<void> acceptRequest() async {
    await RequestService().acceptRequest(widget.req_id, context).then((value) {
      if (value?.type == "success") {
        setState(() {
          widget.req_status = "accepted";
        });
      }
    });
  }

  Future<void> rejectRequest() async {
    await RequestService().rejectRequest(widget.req_id, context).then((value) {
      if (value?.type == "success") {
        setState(() {
          widget.req_status = "rejected";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OtherProfileScreen(id: widget.client_id)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.primaryRed.withAlpha(10),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primaryRed.withAlpha(70),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Profile Image with Padding
                  widget.req_status == "Rejected"
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              AppColors
                                  .grey, // This will apply the grayscale effect
                              BlendMode
                                  .saturation, // Apply the grayscale effect using saturation
                            ),
                            child: CachedNetworkImage(
                              imageUrl: widget.image,
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: AppColors.grey,
                                highlightColor: AppColors.lightGrey,
                                child: Container(
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.image,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.4,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: AppColors.grey,
                              highlightColor: AppColors.lightGrey,
                              child: Container(
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(width: 16),

                  // Details Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        // Name
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                        ),

                        Text(
                          widget.location,
                          style: const TextStyle(fontSize: 12),
                        ),

                        const SizedBox(height: 5),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${calculateAge(widget.age)}, ${widget.height} cm",
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              widget.religion,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              widget.role,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        // Text(
                        //     description,
                        //     style: const TextStyle(
                        //       fontSize: 14,
                        //       color: AppColors.psychotext,
                        //     ),
                        // ),

                        // Buttons
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  switch (widget.req_status) {
                                    "accepted" => "Both liked eachother",
                                    "pending" => "He liked your Profile",
                                    _ => "He liked your Profile",
                                  },
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                                // widget.req_status == "Pending"
                                //     ? // Chat Button
                                //     Row(
                                //         children: [
                                //           Icon(
                                //             Icons.circle,
                                //             size: 10,
                                //             color: AppColors.grey.withAlpha(100),
                                //           ),
                                //           const SizedBox(width: 10,),
                                //           const Text(
                                //             "10 Jan 2025",
                                //             style: TextStyle(
                                //               fontSize: 14,
                                //               color: AppColors.black,
                                //             ),
                                //           ),
                                //         ],
                                //       )
                                //     : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Last seen on 30/12/2025",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              widget.req_status == "accepted"
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Take the next step and contact him directly",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        MessageButton(text: "Message")
                      ],
                    )
                  : widget.req_status == "pending"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "Accept his interest to communicate further",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: DeclineButton(
                                  text: "Decline",
                                  onPressed: rejectRequest,
                                )),
                                SizedBox(width: 10),
                                Expanded(
                                    child: AcceptButton(
                                  text: "Accept",
                                  onPressed: acceptRequest,
                                )),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "You have declined this request",
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
              // : const CustomButton(text: "Message")
            ],
          ),
        ),
      ),
    );
  }
}
