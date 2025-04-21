import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/fe.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/home/service/home_service.dart';

class UserCard extends StatefulWidget {
  final String image;
  final String name;
  final String location;

  const UserCard(
      {required this.name,
      required this.location,
      super.key,
      required this.image});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  
  Future<void> sendInterestToUser() async {
    await HomeService().sentInterestToUser("3", context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 1.1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: [
              // Background image
              Image.asset(
                widget.image, // You can change this to any image you'd like
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),

              // Gradient overlay at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54, // Black color at the bottom
                        Colors.transparent, // Transparent color at the top
                      ],
                    ),
                  ),
                ),
              ),
              // Name and location
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name, // Use the name from the constructor
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget
                            .location, // Use the location from the constructor
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 60,
                        color: AppColors.primaryRed,
                      ),
                      IconButton(
                          onPressed: () {
                            sendInterestToUser();
                          },
                          icon: Iconify(Fe.heart,
                              size: 35, color: AppColors.white))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
