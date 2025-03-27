import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:inakal/constants/widgets/light_pink_gradient_from_top.dart';
import 'package:inakal/features/tailored_matches/widgets/matchcard_widget.dart';

class MatchesScreen extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {
      'name': 'Kalidas R, 27',
      'location': 'Perumbavoor, Kochi',
      'image': 'assets/vectors/kalidas.jpeg',
    },
    {
      'name': 'Nirmal Pillai, 28',
      'location': 'Chennai, Tamil Nadu',
      'image': 'assets/vectors/nirmal.jpeg',
    },
    {
      'name': 'Suriya, 22',
      'location': 'Chennai, Tamil Nadu',
      'image': 'assets/vectors/suriya.jpeg',
    },
    {
      'name': 'Shahid Thomas, 29',
      'location': 'Shivaji Palace, New Delhi',
      'image': 'assets/vectors/shahid.jpeg',
    },
    {
      'name': 'Vishal S, 24',
      'location': 'Bangalore, Karnataka',
      'image': 'assets/vectors/tovi.jpg',
    },
    {
      'name': 'Ajith Kumar, 30',
      'location': 'Kerala, India',
      'image': 'assets/vectors/anirudh.jpg',
    },
  ];

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
              angle: -0.3, // Adjust the angle as needed
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
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    child: Row(
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
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    //To move the butterfly little down
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Positioned(
                                      top: 10,
                                      child: Transform.rotate(
                                        angle: -0.5,
                                        child: const Align(
                                          alignment: Alignment.bottomRight,
                                          child: const Opacity(
                                            opacity: 0.6,
                                            child: Iconify(
                                              Ph.butterfly_duotone,
                                              size: 14,
                                              color: AppColors.primaryRed,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                            const SizedBox(height: 10,)
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                      "Discover personalized profiles thoughtfully curated by expert counselors, perfectly aligned with your interests and preferences for meaningful connections."),
                  const SizedBox(height: 15),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                    ),
                    itemCount: matches.length,
                    itemBuilder: (context, index) {
                      final match = matches[index];
                      return MatchCardWidget(
                        image: match['image']!,
                        name: match['name']!,
                        location: match['location']!,
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
