import 'package:flutter/material.dart';
import 'package:inakal/features/tailored_matches/widgets/header_widget.dart';
import 'package:inakal/features/tailored_matches/widgets/matchcard_widget.dart';


class MatchesScreen extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {
      'name': 'Kalidas R, 27',
      'location': 'Perumbavoor, Kochi',
      'image': 'assets/vectors/kalidas.png',
    },
    {
      'name': 'Nirmal Pillai, 28',
      'location': 'Chennai, Tamil Nadu',
      'image': 'assets/vectors/nirmal.png',
    },
    {
      'name': 'Suriya, 22',
      'location': 'Chennai, Tamil Nadu',
      'image': 'assets/vectors/suriya.png',
    },
    {
      'name': 'Shahid Thomas, 29',
      'location': 'Shivaji Palace, New Delhi',
      'image': 'assets/vectors/shahid.png',
    },
    {
      'name': 'Vishal S, 24',
      'location': 'Bangalore, Karnataka',
      'image': 'assets/vectors/tovi.png',
    },
    {
      'name': 'Ajith Kumar, 30',
      'location': 'Kerala, India',
      'image': 'assets/vectors/anirudh.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              HeaderWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
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
        //bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
