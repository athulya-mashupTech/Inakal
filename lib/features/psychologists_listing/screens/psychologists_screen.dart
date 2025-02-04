import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/psychologists_listing/widgets/premarital_card.dart';
import 'package:inakal/features/psychologists_listing/widgets/profile_card.dart';
import 'package:inakal/model/psychologist_model.dart';

class PsychologistScreen extends StatefulWidget {
  const PsychologistScreen({super.key});

  @override
  State<PsychologistScreen> createState() => _PsychologistScreenState();
}

class _PsychologistScreenState extends State<PsychologistScreen> {
  List<PsychologistModel> psychologists = [];

  @override
  void initState() {
    super.initState();
    psychologists = PsychologistModel.getSamplePsychologists();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Card with Icon
            Padding(
              
              padding:  EdgeInsets.only(top: 80, left: 10, right: 10),
              child: PremaritalCard(
  firstText: "Pre-Marital",
  secondText: "Harmony",
  topRightWidget: Image.asset(
    'assets/vectors/arrow.png', 
    fit: BoxFit.cover,
  ),
  backgroundColor: AppColors.deepBlue,
),

            ),
            const SizedBox(height: 16),

            // Text Section
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Match Makers",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepBlue),
              ),
            ),
            //const SizedBox(height: 8),

            // List of Profile Cards
            Expanded(
                child: ListView.builder(
                    itemCount: psychologists.length,
                    itemBuilder: (context, index) {
                      return ProfileCard(
                          name: psychologists[index].name,
                          location: psychologists[index].location,
                          //description: psychologists[index].description,
                          occupation: psychologists[index].occupation,
                          imagePath: psychologists[index].imagePath);
            }
            )
            ),
          ],
        ),
      ),
    );
  }
}






