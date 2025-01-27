import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class MessageButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const MessageButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.87,
        height: 40,
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
