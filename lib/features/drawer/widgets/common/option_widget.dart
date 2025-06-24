import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class OptionWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onPressed;
  const OptionWidget({super.key, required this.label, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.symmetric(horizontal: 8.0),
     decoration: BoxDecoration(
       color: AppColors.primaryRed,
       borderRadius: BorderRadius.circular(50.0),
     ),
     child: Row(
      mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
        const SizedBox(width: 8.0),
         Text(label, style: const TextStyle(fontSize: 14.0, color: AppColors.white)),
         IconButton(
          icon: Icon(icon, color: AppColors.white, size: 20.0), 
          onPressed: onPressed),
         
       ],
     ),
    );
  }
}