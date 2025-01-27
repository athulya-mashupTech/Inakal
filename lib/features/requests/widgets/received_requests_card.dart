import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/requests/widgets/accept_button.dart';
import 'package:inakal/features/requests/widgets/decline_button.dart';
import 'package:inakal/features/requests/widgets/message_button.dart';

class ReceivedRequestsCard extends StatefulWidget {
  final String image;
  final String name;
  final String location;
  final String status;
  final String age;
  final String height;
  final String religion;
  final String role;
  final String req_status;

  const ReceivedRequestsCard({
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
  });

  @override
  State<ReceivedRequestsCard> createState() => _ReceivedRequestsCardState();
}

class _ReceivedRequestsCardState extends State<ReceivedRequestsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                            Colors.grey, // This will apply the grayscale effect
                            BlendMode
                                .saturation, // Apply the grayscale effect using saturation
                          ),
                          child: Image.asset(
                            widget.image,
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.35,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.image,
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.35,
                          fit: BoxFit.cover,
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
                        ),
                      ),

                      Text(
                        widget.location,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.age} Year, ${widget.height}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.religion,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.role,
                            style: const TextStyle(
                              fontSize: 14,
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
                                  "Accepted" => "You both liked eachother",
                                  "Pending" => "He liked your Profile",
                                  _ => "He liked your Profile",
                                },
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              widget.req_status == "Pending"
                                  ? // Chat Button
                                  Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: AppColors.grey.withAlpha(100),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          "10 Jan 2025",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                          SizedBox(width: 10,),
                          widget.req_status == "Pending"
                              ? const Row(
                                  children: [
                                    Text(
                                      "Expires on 15 Feb 2025",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.primaryRed,
                                      ),
                                    ),
                                    SizedBox(width: 3,),
                                    Icon(
                                      Icons.info_rounded,
                                      size: 15,
                                      color: AppColors.primaryRed,
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            widget.req_status == "Accepted"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Take the next step and contact him directly",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const MessageButton(text: "Message")
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Accept his interest to communicate further",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DeclineButton(text: "Decline"),
                          AcceptButton(text: "Accept"),
                        ],
                      ),
                    ],
                  ),
            // : const CustomButton(text: "Message")
          ],
        ),
      ),
    );
  }
}
