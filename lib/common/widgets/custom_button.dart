import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final IconData? icon;
  final double? height;
  final double? cornerRadius;
  const CustomButton(
      {super.key, required this.text, this.onPressed, this.color, this.icon, this.height, this.cornerRadius,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: height ?? 50,
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius ?? 30),
              ),
              backgroundColor: color ?? AppColors.primaryRed),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Row(
                  children: [
                    Icon(
                      icon,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              Text(
                text,
                style: const TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
