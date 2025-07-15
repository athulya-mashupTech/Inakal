import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient_from_top.dart';
import 'package:inakal/features/tailored_matches/widgets/matches_card.dart';
import 'package:lottie/lottie.dart';

class MatchesScreen extends StatelessWidget {
  final List<Map<String, String>> matches = [];
  //   {
  //     'name': 'Kalidas R',
  //     'designation': 'Perumbavoor, Kochi',
  //     'image': 'assets/vectors/kalidas.jpeg',
  //   },
  //   {
  //     'name': 'Nirmal Pillai',
  //     'designation': 'Chennai, Tamil Nadu',
  //     'image': 'assets/vectors/nirmal.jpeg',
  //   },
  //   {
  //     'name': 'Suriya',
  //     'designation': 'Chennai, Tamil Nadu',
  //     'image': 'assets/vectors/suriya.jpeg',
  //   },
  //   {
  //     'name': 'Shahid Thomas',
  //     'designation': 'Shivaji Palace, New Delhi',
  //     'image': 'assets/vectors/shahid.jpeg',
  //   },
  //   {
  //     'name': 'Vishal S',
  //     'designation': 'Bangalore, Karnataka',
  //     'image': 'assets/vectors/tovi.jpg',
  //   },
  //   {
  //     'name': 'Ajith Kumar',
  //     'designation': 'Kerala, India',
  //     'image': 'assets/vectors/anirudh.jpg',
  //   },
  // ];

  MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const LightPinkGradientFromTop(),
          Positioned(
            top: -30,
            left: 15,
            child: Transform.rotate(
              angle: -0.3,
              child: Image.asset(
                "assets/vectors/dotted_design1.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Tailored  ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              TextSpan(
                                text: 'Matches',
                                style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Transform.rotate(
                          angle: 0.5,
                          child: const Align(
                            child: Opacity(
                              opacity: 0.6,
                              child: Iconify(
                                Ph.butterfly_duotone,
                                size: 16,
                                color: AppColors.primaryRed,
                              ),
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                        "Discover personalized profiles thoughtfully curated by expert counselors, perfectly aligned with your interests and preferences for meaningful connections."),
                    const SizedBox(height: 15),
                    matches.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.5, // Adjust based on how much header content there is
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    "assets/lottie/empty_data.json",
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "No Matches Found",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: matches.map((match) {
                              return MatchesCard(
                                image: match['image']!,
                                name: match['name']!,
                                designation: match['designation']!,
                              );
                            }).toList(),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
