import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/vectors/ath.jpeg',
            height: 200,
            width: 200,
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(color: AppColors.black, fontSize: 30),
                ),
                const Text(
                  'inakal.com',
                  style: TextStyle(
                      color: AppColors.brightRed,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                    text: 'inakal.com ',
                    style: TextStyle(
                      color: AppColors.primaryRed,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text:
                   " is not just a matrimony platform; it’s a mission-driven community dedicated to promoting enduring, meaningful relationships. The name inakal means pairs in Malayalam, symbolizing our commitment to uniting like-minded life partners who share a belief in the timeless value of marriage and true companionship. At inakal.com, we recognize that marriage is a journey that flourishes with understanding and support. Unlike traditional matrimonial sites, we are managed by a dedicated team of psychologists, doctors, and astrologers who are deeply invested in the success of each partnership. With services that include pre-marital counseling upon request, our goal is to provide couples with resources to foster strong, healthy relationships.",
                    style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 24, 24, 24), fontWeight: FontWeight.w100),
                  )
                ]),
                textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
