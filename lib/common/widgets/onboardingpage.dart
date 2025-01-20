import 'package:flutter/material.dart';


class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,
          height: 300,width: 300
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
            style: const TextStyle(fontSize: 16, 
            //color: AppColors.black
            ),
          ),
        ],
      ),
    )
    );
  }
}
