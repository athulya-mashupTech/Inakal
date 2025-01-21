import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  const CustomButton(
      {super.key, required this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              backgroundColor: AppColors.primaryRed),
          child: Text(
            text,
            style: const TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
