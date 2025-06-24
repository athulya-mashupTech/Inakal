import 'package:flutter/material.dart';

class DetailsRowWidget extends StatelessWidget {
  final String label;
  final Widget valueWidget;
  const DetailsRowWidget({super.key, required this.label, required this.valueWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label, textAlign: TextAlign.start)),
        valueWidget
      ],
    );
  }
}
