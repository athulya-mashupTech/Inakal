import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class LightPinkGradientFromTop extends StatelessWidget {
  const LightPinkGradientFromTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: AppColors.lightPinkWhiteGradientFromTop,
                ),
              ),
            );
  }
}