import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/widgets/custom_icon.dart';
import 'package:inakal/features/psychologists_listing/screens/counsellors_screen.dart';

class PremaritalCard extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Widget topRightWidget;
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
    return Stack(
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: backgroundColor,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(right: 58.0),
                  child: Text(
                    "Navigate your journey to marriage with expert guidance, ensuring understanding, communication, and a strong foundation.",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -70,
          right: -50,
          child: Image.asset(
            'assets/vectors/dotted_design2.png',
            width: 250,
            height: 250,
          ),
        ),
        Positioned(
          top: 15,
          right: 20,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CustomIcon(
                color: AppColors.white,
                icon: Icons.arrow_forward,
                iconColor: AppColors.deepBlue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CounsellorsScreen())
                          );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
