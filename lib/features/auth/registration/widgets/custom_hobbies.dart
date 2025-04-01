import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class InterestItem extends StatelessWidget {
  final String interest;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestItem({
    Key? key,
    required this.interest,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.white,   
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.primaryRed,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              ),
            if (isSelected) const SizedBox(width: 8),
            Text(
              interest,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}