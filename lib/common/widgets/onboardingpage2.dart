import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage2({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height: 200),
            Image.asset(image, width: MediaQuery.of(context).size.width),
          ],
        ),

        Positioned(
          top: 80,
          child: Image.asset(
            "assets/vectors/ellipse1.png",
            width: 250,
          )
        ),

        Positioned(
          top: 240,
          left: 5,
          child: Image.asset(
            "assets/vectors/ellipse2.png",
            width: 230,
          )
        ),

        Positioned(
          top: 260,
          right: 5,
          child: Image.asset(
            "assets/vectors/ellipse3.png",
            width: 250,
          )
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Container(
              width: 300,
              height: 400,
            ),
            //const SizedBox(height: 10 , width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
