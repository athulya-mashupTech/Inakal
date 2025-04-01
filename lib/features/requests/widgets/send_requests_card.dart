import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class SendRequestsCard extends StatefulWidget {
  final String image;
  final String name;
  final String location;
  final String status;
  final String age;
  final String height;
  final String religion;
  final String role;
  final String req_status;

  const SendRequestsCard({
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
  State<SendRequestsCard> createState() => _SendRequestsCardState();
}

class _SendRequestsCardState extends State<SendRequestsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      decoration: BoxDecoration(
        color: switch (widget.req_status) {
          "Accepted" => AppColors.freshGreen.withAlpha(20),
          "Pending" => AppColors.goldenYellow.withAlpha(20),
          "Rejected" => AppColors.grey.withAlpha(20),
          _ => AppColors.black.withAlpha(20),
        },
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: switch (widget.req_status) {
            "Accepted" => AppColors.freshGreen.withAlpha(70),
            "Pending" => AppColors.goldenYellow.withAlpha(70),
            "Rejected" => AppColors.grey.withAlpha(70),
            _ => AppColors.black.withAlpha(70),
          },
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
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
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.30,
                      fit: BoxFit.cover,
                    ),
                  ),
            const SizedBox(width: 16),

            // Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 5),
                      // Name
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        widget.location,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.age} Year, ${widget.height}",
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    switch (widget.req_status) {
                                      "Accepted" => "Request Accepted",
                                      "Pending" => "Request Pending",
                                      "Rejected" => "Request Pending",
                                      _ => "Unknown",
                                    },
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: switch (widget.req_status) {
                                        "Accepted" => AppColors.freshGreen,
                                        "Pending" => AppColors.goldenYellow,
                                        "Rejected" => AppColors.darkRed,
                                        _ => AppColors.black,
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Icon(
                                      switch (widget.req_status) {
                                        "Accepted" => Icons.check,
                                        "Pending" => Icons.warning_rounded,
                                        "Rejected" => Icons.close,
                                        _ => Icons.error,
                                      },
                                      color: switch (widget.req_status) {
                                        "Accepted" => AppColors.freshGreen,
                                        "Pending" => AppColors.goldenYellow,
                                        "Rejected" => AppColors.darkRed,
                                        _ => AppColors.black,
                                      },
                                      size: 20),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      widget.req_status == "Accepted"
                      ? // Chat Button
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.freshGreen,
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(
                              Icons.chat,
                              color: AppColors.white,
                            ),
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
      ),
    );
  }
}
