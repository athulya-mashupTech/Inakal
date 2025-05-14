import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/fe.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/functions/functions.dart';
import 'package:inakal/features/home/service/home_service.dart';
import 'package:shimmer/shimmer.dart';

class UserCard extends StatefulWidget {
  final String clientId;
  final String image;
  final String name;
  final String dob;
  final String location;
  final String likedBy;

  const UserCard(
      {required this.name,
      required this.location,
      required this.dob,
      super.key,
      required this.image,
      required this.likedBy,
      required this.clientId});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  Future<void> sendInterestToUser() async {
    await HomeService().sentInterestToUser(widget.clientId, context);
  }

  Future<void> toggleLikedBy() async {
    await HomeService().toggleLikedBy(widget.clientId, context);
  }

  late String likedBy = widget.likedBy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            // Background image
            CachedNetworkImage(
                imageUrl: widget.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: AppColors.grey,
                      highlightColor: AppColors.lightGrey,
                      child: Container(
                        color: AppColors.grey,
                      ),
                    ),
                errorWidget: (context, url, error) => CachedNetworkImage(
                    imageUrl:
                        "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity)),
    
            // Gradient overlay at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
    
            // Name and location
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.location,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    
            // Age in the top-right corner
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  Functions.calculateAge(widget.dob), // Static age
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    
            Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 30,
                    color: likedBy == "NO"
                        ? Colors.transparent
                        : AppColors.white, // Hollow if likedBy is not "NO"
                  ),
                  IconButton(
                    onPressed: () {
                      // sendInterestToUser();
                      toggleLikedBy();
                      setState(() {
                        likedBy = likedBy == "NO" ? "YES" : "NO";
                      });
                    },
                    icon: Iconify(
                      Fe.heart,
                      size: 15,
                      color: likedBy == "NO"
                          ? Colors.white
                          : AppColors.primaryRed,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
