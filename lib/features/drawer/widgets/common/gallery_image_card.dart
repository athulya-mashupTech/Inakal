import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class GalleryImageCard extends StatelessWidget {
  final String image;
  final VoidCallback onDelete;
  final String isPublic; // Add a callback to handle deletion

  const GalleryImageCard({
    super.key,
    required this.isPublic,
    required this.image,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image with rounded corners
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image,
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
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        if(isPublic != "1")
        // Gradient overlay at the bottom
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color.fromARGB(196, 0, 0, 0),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        if(isPublic != "1") 
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Waiting for admin to approve this image for public view.",
              style: TextStyle(
                  color: AppColors.fadeWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ), 
        if(isPublic != "1") 
        Align(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Icon(
                Icons.lock,
                color: AppColors.fadeWhite,
              )),
        ),
        // Close button in top-right corner
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: onDelete,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha((255 * 0.6).round()),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                color: AppColors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
