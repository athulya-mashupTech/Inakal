import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class AddHobbieWidget extends StatelessWidget {
  const AddHobbieWidget({super.key, required this.label, required this.icon, this.onPressed});
  final String label;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.symmetric(horizontal: 8.0),
     decoration: BoxDecoration(
       color: AppColors.white,
       borderRadius: BorderRadius.circular(50.0),
       border: Border.all(color: AppColors.primaryRed, width: 1.0),
     ),
     child: Row(
      mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
        const SizedBox(width: 8.0),
         Text(label, style: const TextStyle(fontSize: 14.0, color: AppColors.primaryRed)),
         IconButton(
          icon: Icon(icon, color: AppColors.primaryRed, size: 20.0), 
          onPressed: onPressed),
         
       ],
     ),
    );
  }
}