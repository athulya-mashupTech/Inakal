import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/widgets/custom_icon.dart';
import 'package:lottie/lottie.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Lottie.asset(
                'assets/lottie/about.json',
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
                      text: const TextSpan(
                      children: [
                    TextSpan(
                      text: 'inakal.com ',
                      style: TextStyle(
                        color: AppColors.primaryRed,
                        fontWeight: FontWeight.normal,
                        fontSize: 15
                      ),
                    ),
                    TextSpan(
                      text:
                     " is not just a matrimony platform.It’s a mission-driven community dedicated to promoting enduring, meaningful relationships. The name inakal means pairs in Malayalam, symbolizing our commitment to uniting like-minded life partners who share a belief in the timeless value of marriage and true companionship. At inakal.com, we recognize that marriage is a journey that flourishes with understanding and support. Unlike traditional matrimonial sites, we are managed by a dedicated team of psychologists, doctors, and astrologers who are deeply invested in the success of each partnership. With services that include pre-marital counseling upon request, our goal is to provide couples with resources to foster strong, healthy relationships.",
                      style: TextStyle(fontSize: 15, color: AppColors.black, fontWeight: FontWeight.w100),
                    )
                  ]),
                  textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Our vision',
                            style: TextStyle(color: AppColors.black, fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Let Marriages be Eternal.',
                            style: TextStyle(color: AppColors.black, fontSize: 15),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                            'Our Mission',
                            style: TextStyle(color: AppColors.black, fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Save Marriages.',
                            style: TextStyle(color: AppColors.black, fontSize: 15),
                          ),
                      ],
                    ),
                  ) ,
                ],  
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10,left:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            Row(
            children: [
              CustomIcon(icon: Icons.phone,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                          Text(
                            'Enquiry',
                            style: TextStyle(color: AppColors.black, fontSize: 15,fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '+91 9867543986',
                                      style: TextStyle(color: AppColors.black, fontSize: 15),
                             ), 
                        ],
                     ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                      CustomIcon(icon: Icons.email),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              'Get Support',
                              style: TextStyle(color: AppColors.black, fontSize: 15,fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'inakal@inakal.com',
                                        style: TextStyle(color: AppColors.black, fontSize: 15),
                               ), 
                          ],
                       ),
                      ],
                    ),
                  ),
                ],
             ),
          ),
        ],
      ),
    )
    );
  }
}
