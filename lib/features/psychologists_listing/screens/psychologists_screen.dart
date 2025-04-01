import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/psychologists_listing/widgets/premarital_card.dart';
import 'package:inakal/features/psychologists_listing/widgets/profile_card.dart';
import 'package:inakal/data_class/psychologist_model.dart';

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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
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

              Expanded(
                  child: ListView.builder(
                      itemCount: psychologists.length,
                      itemBuilder: (context, index) {
                        return ProfileCard(
                            name: psychologists[index].name,
                            location: psychologists[index].location,
                            occupation: psychologists[index].occupation,
                            imagePath: psychologists[index].imagePath);
              }
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}






