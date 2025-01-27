import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String occupation;
  final String location;
  final void Function()? onTakeAppointment;
  final void Function()? onChat;

  const ProfileCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.occupation,
    required this.location,
    this.onTakeAppointment,
    this.onChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal:16 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: AppColors.blueWhiteGradient,
        border: Border.all(
          color: AppColors.lightSkyBlue,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Profile Image with Padding
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                imagePath,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
        
            // Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepBlue,
                    ),
                  ),
                  // const SizedBox(height: 8),
                  // Subheadings
                  Text(
                      location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.psychotext,
                      ),
                  ),
                  Text(
                      occupation,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.psychotext,
                      ),
                  ),
                  // const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Take Appointment Button
                      ElevatedButton(
                        onPressed: onTakeAppointment ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.deepBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                          child: const Text(
                          "Take Appointment",
                          style: TextStyle(color: AppColors.white),
                          ),
                      ),
                      //const SizedBox(width: 4),
        
                      // Chat Button
                      ElevatedButton(
                        onPressed: onChat ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.deepBlue,
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.chat,
                          color: AppColors.white,
                        ),
                      ),
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

