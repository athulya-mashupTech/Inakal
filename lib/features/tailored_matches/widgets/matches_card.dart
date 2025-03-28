import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

class MatchesCard extends StatelessWidget {
  const MatchesCard({super.key, required this.image, required this.name, required this.designation});
  final String image;
  final String name;
  final String designation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5 - 30,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Card(
            color: AppColors.white,
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.5 - 30,
                  child: Image.asset(image, fit: BoxFit.cover)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      // SizedBox(height: 5),
                      Text(designation,
                          style: TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
