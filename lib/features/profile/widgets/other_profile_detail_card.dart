import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class OtherProfileDetailCard extends StatelessWidget {
  final String title;
  final String value;
  const OtherProfileDetailCard(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Icon(
          Icons.circle,
          size: 10,
          color: AppColors.primaryRed,
        ),
        const SizedBox(width: 3),
        Text("$title -  ", style: const TextStyle(fontSize: 14)),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,))),
      ],
    );
  }
}
