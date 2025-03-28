import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/psychologists_listing/widgets/counsellor_widget.dart';

class CounsellorsScreen extends StatefulWidget {
  const CounsellorsScreen({super.key});

  @override
  State<CounsellorsScreen> createState() => _CounsellorsScreenState();
}

class _CounsellorsScreenState extends State<CounsellorsScreen> {
  var btext = "Book your appointment";
  var bcolor = AppColors.deepBlue;
  final List<Map<String, String>> matches = [
    {
      'name': 'Kalidas R',
      'designation': 'Clinical psychologist',
      'image': 'assets/vectors/kalidas.jpeg',
    },
    {
      'name': 'Nirmal Pillai',
      'designation': 'Clinical psychologist',
      'image': 'assets/vectors/nirmal.jpeg',
    },
    {
      'name': 'Suriya S',
      'designation': 'Clinical psychologist',
      'image': 'assets/vectors/suriya.jpeg',
    },
    {
      'name': 'Shahid Thomas',
      'designation': 'Clinical psychologist',
      'image': 'assets/vectors/shahid.jpeg',
    },
    {
      'name': 'Vishal S',
      'designation': 'Clinical psychologist',
      'image': 'assets/vectors/tovi.jpg',
    },
    {
      'name': 'Ajith Kumar',
      'designation': 'Clinical psychologist',
      'image': 'assets/vectors/anirudh.jpg',
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CustomButton(
                    text: btext,
                    onPressed: () {
                      setState(() {
                        btext = "Your appointment is scheduled";
                        bcolor = AppColors.freshGreen;
                      });
                    },
                    color: bcolor,
                    icon: Icons.calendar_month,
                    height: 60,
                    cornerRadius: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
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
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                          "Connect with our trusted doctors and specialists effortlessly to find your Perfect Matches.",
                          style:
                              TextStyle(color: AppColors.grey, fontSize: 12)),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Wrap(
                      spacing: 5.0,
                      runSpacing: 5.0,
                      children: matches.map((match) {
                        return CounsellorWidget(
                          image: match['image']!,
                          name: match['name']!,
                          designation: match['designation']!,
                        );
                      }).toList(),
                    ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
