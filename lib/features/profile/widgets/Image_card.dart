import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.grey,
              highlightColor: AppColors.lightGrey,
              child: Container(
                color: AppColors.grey,
              ),
            ),
          ),
        ));
  }
}
