import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class GenderSelectionWidget extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String> onGenderSelected;

  const GenderSelectionWidget({
    required this.selectedGender,
    required this.onGenderSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildGenderOption(
          context: context,
          gender: 'Male',
          icon: Icons.male,
        ),
        _buildGenderOption(
          context: context,
          gender: 'Female',
          icon: Icons.female,
        ),
      ],
    );
  }

  Widget _buildGenderOption({
    required BuildContext context,
    required String gender,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () => onGenderSelected(gender),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color:
              selectedGender == gender ? AppColors.primaryRed : AppColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color:
                  selectedGender == gender ? AppColors.white : AppColors.black,
            ),
            const SizedBox(height: 8.0),
            Text(
              gender,
              style: TextStyle(
                fontSize: 16,
                color: selectedGender == gender
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
