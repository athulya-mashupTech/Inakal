import 'package:flutter/material.dart';

class DetailsColumnWidget extends StatelessWidget {
  final String label;
  final Widget valueWidget;
  
  const DetailsColumnWidget({super.key, required this.label, required this.valueWidget});
  

  @override
  Widget build(BuildContext context) {
   return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, textAlign: TextAlign.start),
        SizedBox(height: 10),
        valueWidget
      ],
    );
  }
}