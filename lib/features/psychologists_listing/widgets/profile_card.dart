import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final List<String> subheadings;
  final void Function()? onTakeAppointment;
  final void Function()? onChat;

  const ProfileCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.subheadings,
    this.onTakeAppointment,
    this.onChat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: AppColors.blueWhiteGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.psychotext,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile Image with Padding
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepBlue,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Subheadings
                  ...subheadings.map(
                    (subheading) => Text(
                      subheading,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.psychotext,
                      ),
                    ),
                  ),

                  // Buttons
                  SizedBox(height: 16),
                  Row(
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
                        child: Text("Take Appointment"),
                      ),
                      SizedBox(width: 8),

                      // Chat Button
                      ElevatedButton(
                        onPressed: onChat ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.deepBlue,
                          shape: CircleBorder(),
                        ),
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
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

