import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
              text: const TextSpan(
              children: [
              TextSpan(
                text: 'Tailored  ',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                  ),
              ),
              TextSpan(
                text: 'Matches',
                style: TextStyle(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.bold,
                fontSize: 24),
              ),
              ],
              ),
              ),
            ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 0.75,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
