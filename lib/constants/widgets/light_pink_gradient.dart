import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class LightPinkGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: AppColors.pinkWhiteGradient,
                ),
              ),
            );
  }
}