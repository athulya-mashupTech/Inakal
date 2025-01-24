import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class PremaritalCard extends StatelessWidget {
  final String firstText; // "Pre-Marital"
  final String secondText; // "Harmony"
  final IconData icon; // Icon on the top right
  final Color backgroundColor;
  const PremaritalCard({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.icon,
    this.backgroundColor = AppColors.lightSkyBlue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: backgroundColor,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            // Heading and Subheading
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: firstText + " ",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: secondText,
                        style: TextStyle(
                          color: AppColors.deepBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Navigate your journey to marriage with expert guidance, ensuring understanding, communication, and a strong foundation.",
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            // Top-Right Icon
            Positioned(
              top: 0,
              right: 0,
              child: Icon(
                icon,
                color: AppColors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
