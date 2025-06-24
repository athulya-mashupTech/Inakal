import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(title, textAlign: TextAlign.start),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
