import 'package:flutter/material.dart';

class OnboardingContainer extends StatelessWidget {
  final String image;
  const OnboardingContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(alignment: Alignment.topCenter, children: [
      Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Image.asset(image, width: MediaQuery.of(context).size.width),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.06,
          child: Image.asset(
            "assets/vectors/ellipse1.png",
            width: MediaQuery.of(context).size.width * 0.5,
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.16,
          left: 0,
          child: Image.asset(
            "assets/vectors/ellipse2.png",
            width: 230,
          )),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.18,
          right: 0,
          child: Image.asset(
            "assets/vectors/ellipse3.png",
            width: 250,
          ))
    ]));
  }
}
