import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/psychologists_listing/widgets/counsellor_widget.dart';

class CounsellorsScreen extends StatelessWidget {
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

  CounsellorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Guiding  ',
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              TextSpan(
                                text: 'Hearts',
                                style: TextStyle(
                                    color: AppColors.deepBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
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
                                              color: AppColors.deepBlue,
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
                                        color: AppColors.deepBlue,
                                      ),
                                    ),
                                    alignment: Alignment.topRight,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    final match = matches[index];
                    return CounsellorWidget(
                      image: match['image']!,
                      name: match['name']!,
                      location: match['location']!,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
