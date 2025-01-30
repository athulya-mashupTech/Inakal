import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:lottie/lottie.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Lottie.asset(
                        "assets/lottie/notification.json",
                        width: 300
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Empty ',
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: 'Notifications',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("You didn't have no new notifications now!"),
                    SizedBox(height: 50)
                  ],
                ),
              ),
            ),
          ),
          LightPinkGradient(),
        ],
      ),
    );
  }
}
