import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/common/widgets/premium_required_popup.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/home/service/home_service.dart';
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
  final String gender;
  final String height;
  final String religion;
  final String role;
  final void Function() realoadFun;
  final String req_status;

  const ReceivedRequestsCard(
      {super.key,
      required this.image,
      required this.name,
      required this.location,
      required this.status,
      required this.role,
      required this.age,
      required this.gender,
      required this.height,
      required this.req_status,
      required this.religion,
      required this.client_id,
      required this.req_id,
      required this.realoadFun});

  @override
  State<ReceivedRequestsCard> createState() => _ReceivedRequestsCardState();
}

class _ReceivedRequestsCardState extends State<ReceivedRequestsCard> {
  String userImage = "";
  bool buttonLoading = false;

  String getHimOrHer(String gender) {
    if (gender == "Female" || gender == "female")
      return "her";
    else if (gender == "Male" || gender == "male")
      return "him";
    else
      return "them";
  }

  String getHisOrHer(String gender) {
    if (gender == "Female" || gender == "female")
      return "her";
    else if (gender == "Male" || gender == "male")
      return "his";
    else
      return "their";
  }

  String getHeOrShe(String gender) {
    if (gender == "Female" || gender == "female")
      return "She";
    else if (gender == "Male" || gender == "male")
      return "He";
    else
      return "They";
  }

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
    setState(() {
      buttonLoading = true;
    });
    await RequestService().acceptRequest(widget.req_id, context).then((value) {
      if (value?.type == "success") {
        widget.realoadFun();
      }
    });
  }

  Future<void> rejectRequest() async {
    setState(() {
      buttonLoading = true;
    });
    await RequestService().rejectRequest(widget.req_id, context).then((value) {
      if (value?.type == "success") {
        widget.realoadFun();
      }
    });
  }

  Future<void> sendRequest() async {
    setState(() {
      buttonLoading = true;
    });
    await HomeService()
        .sentInterestToUser(widget.client_id, context)
        .then((value) {
      if (value?.type == "success") {
        widget.realoadFun();
      }
    });
  }

  @override
  void initState() {
    userImage = widget.image ==
            "https://etutor.s3.ap-south-1.amazonaws.com/users/avatar.png"
        ? "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg"
        : widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Id: " + widget.client_id);
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
                              imageUrl: userImage,
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
                                    "pending" =>
                                      "${getHeOrShe(widget.gender)} liked your Profile",
                                    _ =>
                                      "${getHeOrShe(widget.gender)} liked your Profile",
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
              buildStatusWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatusWidget() {
    switch (widget.req_status) {
      case "message":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Take the next step and contact ${getHimOrHer(widget.gender)} directly",
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(height: 5),
            buttonLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primaryRed,
                      )
                    ],
                  )
                : MessageButton(
                    text: "Message",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(child: PremiumRequiredPopup()),
                      );
                    },
                  ),
          ],
        );

      case "rejected":
        return Center(
          child: Row(
            children: [
              Icon(Icons.close, color: AppColors.darkRed),
              SizedBox(width: 5),
              Text("${getHeOrShe(widget.gender)} rejected your request!", style: TextStyle(color: AppColors.brightRed),)
            ],
          ),
        );

      case "pending":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Accept ${getHisOrHer(widget.gender)} interest to communicate further",
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(height: 5),
            buttonLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primaryRed,
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DeclineButton(
                          text: "Decline",
                          onPressed: rejectRequest,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: AcceptButton(
                          text: "Accept",
                          onPressed: acceptRequest,
                        ),
                      ),
                    ],
                  ),
          ],
        );

      case "send":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "You accepted ${getHisOrHer(widget.gender)} request. Connect back to communicate further",
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(height: 5),
            buttonLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primaryRed,
                      )
                    ],
                  )
                : CustomButton(
                    text: "Send Interest",
                    onPressed: () => sendRequest(),
                  )
          ],
        );

      case "waiting":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Request has been sent to ${getHimOrHer(widget.gender)}",
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(height: 5),
            buttonLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primaryRed,
                      )
                    ],
                  )
                : CustomButton(text: "Waiting for Response"),
          ],
        );

      case "rejected":
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "You have declined ${getHisOrHer(widget.gender)} request!",
            style: TextStyle(fontSize: 13, color: AppColors.darkRed),
          ),
        );

      case "error":
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                Icons.warning_rounded,
                color: AppColors.warmOrange,
              ),
              Text(
                "Something went wrong. Please try again later.",
                style: TextStyle(fontSize: 13, color: AppColors.warmOrange),
              ),
            ],
          ),
        );

      default:
        return SizedBox(); // or a fallback widget
    }
  }
}
