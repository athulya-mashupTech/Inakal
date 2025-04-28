import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/requests/service/request_service.dart';

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
  final String req_id;
  final void Function()? onTap;

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
    required this.req_id,
    required this.onTap,
  });

  @override
  State<SendRequestsCard> createState() => _SendRequestsCardState();
}

class _SendRequestsCardState extends State<SendRequestsCard> {

  Future<void> deleteRequest() async {
    await RequestService().deleteRequest(widget.req_id, context);
  }

  int calculateAge(String birthDateString) {
    DateTime birthDate = DateTime.parse(birthDateString);
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;

    // Check if the birthday has occurred yet this year
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      decoration: BoxDecoration(
        color: switch (widget.req_status) {
          "Accepted" => AppColors.freshGreen.withAlpha(20),
          "pending" => AppColors.goldenYellow.withAlpha(20),
          "rejected" => AppColors.grey.withAlpha(20),
          _ => AppColors.black.withAlpha(20),
        },
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: switch (widget.req_status) {
            "Accepted" => AppColors.freshGreen.withAlpha(100),
            "pending" => AppColors.goldenYellow.withAlpha(70),
            "rejected" => AppColors.grey.withAlpha(70),
            _ => AppColors.black.withAlpha(70),
          },
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                // Profile Image with Padding
                widget.req_status == "Rejected"
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            AppColors.grey, // This will apply the grayscale effect
                            BlendMode
                                .saturation, // Apply the grayscale effect using saturation
                          ),
                          child: Image.network(
                            widget.image,
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.width * 0.30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: widget.image,
                          placeholder: (context, url) => Center(
                            child:
                                CircularProgressIndicator(), // or a custom loader
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
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
                      widget.status == "rejected" ? const SizedBox(height: 5) : const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${calculateAge(widget.age)} Year, ${widget.height} cm",
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
                          widget.req_status == "Accepted"
                              ? Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Chat button action here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.freshGreen,
                                        shape: const CircleBorder(),
                                      ),
                                      child: Iconify(
                                        Ph.chat_circle_dots_fill,
                                        color: AppColors.white,
                                        size: 20,
                                      ),
                                    ),
                                    Text("Message",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.black,
                                        )),
                                  ],
                                )
                              : widget.req_status == "pending"
                                  ? Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: widget.onTap,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.goldenYellow,
                                            shape: const CircleBorder(),
                                          ),
                                          child: const Iconify(
                                            Mdi.delete,
                                            color: AppColors.white,
                                            size: 20,
                                          ),
                                        ),
                                        Text("Delete",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.black,
                                            )),
                                      ],
                                    )
                                  : const SizedBox.shrink()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 4),
              child: Row(
                children: [
                  Icon(
                      switch (widget.req_status) {
                        "Accepted" => Icons.check,
                        "pending" => Icons.warning_rounded,
                        "rejected" => Icons.close,
                        _ => Icons.error,
                      },
                      color: switch (widget.req_status) {
                        "Accepted" => AppColors.freshGreen,
                        "pending" => AppColors.goldenYellow,
                        "rejected" => AppColors.darkRed,
                        _ => AppColors.black,
                      },
                      size: 20),
                  const SizedBox(width: 5),
                  Text(
                    switch (widget.req_status) {
                      "Accepted" => "Request Accepted - You can chat now",
                      "pending" => "Request Pending - Waiting for response",
                      "rejected" => "Not Interested - Find another match",
                      _ => "Unknown",
                    },
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: switch (widget.req_status) {
                        "Accepted" => AppColors.freshGreen,
                        "pending" => AppColors.goldenYellow,
                        "rejected" => AppColors.darkRed,
                        _ => AppColors.black,
                      },
                    ),
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
