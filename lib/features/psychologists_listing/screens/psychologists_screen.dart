import 'package:flutter/material.dart';
import 'package:inakal/features/psychologists_listing/widgets/premarital_card.dart';
import 'package:inakal/features/psychologists_listing/widgets/profile_card.dart';


class PsychologistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Psychologists"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Card with Icon
              PremaritalCard(
                firstText: "Pre-Marital",
                secondText: "Harmony",
                icon: Icons.favorite,
                backgroundColor: Colors.blue.shade700,
              ),
              SizedBox(height: 16),
      
              // Text Section
              const Text(
                "Match Makers",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
      
              // List of Profile Cards
              Expanded(
                child: ListView(
                  children: [
                    ProfileCard(
                      imagePath: "assets/vectors/psycho1.png",
                      name: "Dr. John Doe",
                      subheadings: const [
                        "Specialist in Marriage Counseling",
                        "10+ years of experience",
                        "Certified Psychologist",
                        "Author of 'Healthy Relationships'",
                      ],
                      onTakeAppointment: () {
                        print("Appointment for Dr. John Doe");
                      },
                      onChat: () {
                        print("Chat with Dr. John Doe");
                      },
                    ),
                    ProfileCard(
                      imagePath: "assets/vectors/psycho2.png",
                      name: "Dr. Jane Smith",
                      subheadings: const [
                        "Expert in Family Therapy",
                        "8+ years of experience",
                        "Certified Therapist",
                        "Speaker at Global Therapy Summit",
                      ],
                      onTakeAppointment: () {
                        print("Appointment for Dr. Jane Smith");
                      },
                      onChat: () {
                        print("Chat with Dr. Jane Smith");
                      },
                    ),
                    ProfileCard(
                      imagePath: "assets/vectors/psycho1.png",
                      name: "Dr. John Doe",
                      subheadings: const [
                        "Specialist in Marriage Counseling",
                        "10+ years of experience",
                        "Certified Psychologist",
                        "Author of 'Healthy Relationships'",
                      ],
                      onTakeAppointment: () {
                        print("Appointment for Dr. John Doe");
                      },
                      onChat: () {
                        print("Chat with Dr. John Doe");
                      },
                    ),
                    ProfileCard(
                      imagePath: "assets/vectors/psycho1.png",
                      name: "Dr. John Doe",
                      subheadings: const [
                        "Specialist in Marriage Counseling",
                        "10+ years of experience",
                        "Certified Psychologist",
                        "Author of 'Healthy Relationships'",
                      ],
                      onTakeAppointment: () {
                        print("Appointment for Dr. John Doe");
                      },
                      onChat: () {
                        print("Chat with Dr. John Doe");
                      },
                    ),
                    ProfileCard(
                      imagePath: "assets/vectors/psycho1.png",
                      name: "Dr. John Doe",
                      subheadings: const [
                        "Specialist in Marriage Counseling",
                        "10+ years of experience",
                        "Certified Psychologist",
                        "Author of 'Healthy Relationships'",
                      ],
                      onTakeAppointment: () {
                        print("Appointment for Dr. John Doe");
                      },
                      onChat: () {
                        print("Chat with Dr. John Doe");
                      },
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



