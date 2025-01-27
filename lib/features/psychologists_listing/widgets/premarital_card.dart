import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/psychologists_listing/screens/counsellors_screen.dart';

class PremaritalCard extends StatelessWidget {
  final String firstText; // "Pre-Marital"
  final String secondText; // "Harmony"
  final Widget topRightWidget; // Can be an image or any widget
  final Color backgroundColor;

  const PremaritalCard({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.topRightWidget,
    this.backgroundColor = AppColors.deepBlue,
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
        padding: const EdgeInsets.all(16),
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
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: secondText,
                        style: const TextStyle(
                          color: AppColors.lightSkyBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Navigate your journey to marriage with expert guidance, ensuring understanding, communication, and a strong foundation.",
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
         
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => CounsellorsScreen()));
                  
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: topRightWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



