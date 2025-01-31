import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/profile/screens/profile_screen.dart';

class CustomIcon extends StatefulWidget {
  const CustomIcon({super.key});

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
      const Opacity(
        opacity: 0.3,
        child: Icon(
          Icons.circle,
          color: AppColors.primaryRed,
          size: 60.0,
        ),
      ),
      const Opacity(
        opacity: 0.4,
        child: Icon(
          Icons.circle,
          color: AppColors.primaryRed,
          size: 50.0,
        ),
      ),
      const Opacity(
        opacity: 0.8,
        child: Icon(
          Icons.circle,
          color: AppColors.primaryRed,
          size: 40.0,
        ),
      ),
      IconButton(
        icon: const Icon(
          Icons.phone,
          color: AppColors.white,
          size: 20.0,
        ),
        onPressed: () {
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          );
        },
      ),
    ]);
  }
}
