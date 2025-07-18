import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/widgets/common/notification_card.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class Notification {
  String? title;
  String? subtitle;
  void Function() onPressed;

  Notification(
      {required this.title, required this.subtitle, required this.onPressed});
}

List<Notification> allNotifications = [
  Notification(
      title: "New message from Sreedevi. Tap to read it.",
      subtitle:
          "She found your profile interesting. Tap to see what caught her attention.",
      onPressed: () {}),
  Notification(
      title: "You matched with Meera!",
      subtitle:
          "Both of you liked each other. A beautiful journey may begin here!",
      onPressed: () {}),
  Notification(
      title: "Sneha showed interest in you",
      subtitle:
          "She would like to connect with you. See her profile and respond",
      onPressed: () {}),
  Notification(
      title: "Neha declined your request",
      subtitle:
          "Rejections are part of the journey. Keep exploring to find your match.",
      onPressed: () {}),
  Notification(
      title: "Arjun viewed your profile",
      subtitle: "He might be interested in knowing you. Check his profile now.",
      onPressed: () {}),
  Notification(
      title: "Amal matches your preferences!",
      subtitle:
          "We found a profile that fits your interests perfectly. Take a closer look.",
      onPressed: () {}),
];

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'New  ',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: 'Notifications',
                        style: TextStyle(
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 24,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: allNotifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                      title: allNotifications[index].title!,
                      subtitle: allNotifications[index].subtitle!,
                      onPressed: () {});
                }),
          )
        ],
      )),
    );
  }
}
