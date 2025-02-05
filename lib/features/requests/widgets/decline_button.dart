import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class DeclineButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const DeclineButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(
                color: AppColors.grey, // Grey border color
                width: 1, // Border width
              ),
            ),
            // foregroundColor: AppColors.black, // Text color
            backgroundColor: AppColors.white, // Background color of button
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.close, color: AppColors.black), // Close icon
              const SizedBox(width: 5,),
              Text(
                text,
                style: const TextStyle(color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
