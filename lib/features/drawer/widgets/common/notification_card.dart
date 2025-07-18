import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class NotificationCard extends StatelessWidget {
  String title;
  String subtitle;
  void Function() onPressed;
   NotificationCard({
    required this.title,
    required this.subtitle,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bgsoftpink
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.notifications,color: AppColors.primaryRed,),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18),maxLines: 2,overflow: TextOverflow.ellipsis,),
                           Text(subtitle,)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}