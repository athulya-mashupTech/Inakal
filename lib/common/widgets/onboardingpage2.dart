import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/onboarding_container.dart';

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
        child: Column(
      // alignment: Alignment.topCenter,
      children: [
        OnboardingContainer(image: image),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const SizedBox(height: 10 , width: 10),
              Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
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
        ),
      ],
    ));
  }
}
