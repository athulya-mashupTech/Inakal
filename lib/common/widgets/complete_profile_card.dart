import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class CompleteProfileCard extends StatefulWidget {
  const CompleteProfileCard({super.key});

  @override
  State<CompleteProfileCard> createState() => _CompleteProfileCardState();
}

class _CompleteProfileCardState extends State<CompleteProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0), // Match card border radius
        child: Card(
          color: AppColors.primaryRed,
          clipBehavior: Clip.hardEdge, // Ensures children are clipped
          child: Stack(
            children: [
    
              Positioned(
              bottom: 40,
              right: 40,
              child: Transform.rotate(
                angle: 10 * 3.1415927 / 180,
                child: Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/vectors/heart_pattern1.png'),
                  ),
                ),
              ),
            ),
              Positioned(
                bottom: -35,
                right: -35,
                child: Transform.rotate(
                  angle: -45 * 3.1415927 / 180,
                  child: Opacity(
                    opacity: 0.5,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/vectors/heart_pattern1.png'),
                    ),
                  ),
                ),
              ),
    
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Row(
                  children: [
                    // Image.asset(
                    //   "assets/vectors/heart_pattern1.png",
                    //   height: 80,
                    //   width: 80,
                    // ),
    
                    Stack(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          child: CircularProgressIndicator(
                            value: 0.25,
                            strokeWidth: 7,
                            backgroundColor: AppColors.white.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.white),
                          ),
                        ),
                        Center(
                          child: Container(
                          height: 65,
                          width: 65,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("20%", style: TextStyle(color: AppColors.white, fontSize: 15, fontWeight: FontWeight.w600),),
                              ],
                            ),
                          )
                        )
                      ],
                    ),
    
    
                    const SizedBox(width: 20), // Add spacing between image and text
                    const Expanded(
                      child: Text(
                        "Complete your profile to help us find your perfect match. A detailed profile leads to better connections!",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.white), // Adjust text size if needed
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
