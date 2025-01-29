import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:inakal/common/widgets/complete_profile_card.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:inakal/features/profile/widgets/Image_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> images = [
    "assets/vectors/harsha1.jpg",
    "assets/vectors/harsha2.jpg",
    "assets/vectors/harsha3.jpg",
    "assets/vectors/harsha4.jpg",
    "assets/vectors/harsha1.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: AppColors.white,
              ),
              LightPinkGradient(),
            ],
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'My ',
                            style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: 'Profile',
                            style: TextStyle(
                              color: AppColors.primaryRed,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.primaryRed,
                                width: 3,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/vectors/harsha1.jpg',
                                width: 160,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "#INK3929",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.primaryRed),
                                  ),
                                  Text(
                                    "Harsha Sreekanth",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1),
                                  ),
                                  Text(
                                    "Perumbavoor, Kerala",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Fashion designer",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Bhramin",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Iconify(
                            Mdi.numbers,
                            color: AppColors.primaryRed,
                            size: 21,
                          ),
                          Text(
                            "24 year",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: 12),
                          Iconify(
                            Mdi.human_male_height_variant,
                            color: AppColors.primaryRed,
                            size: 15,
                          ),
                          Text(
                            " 6’65",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: 12),
                          Iconify(Mdi.weight_lifter,
                              color: AppColors.primaryRed, size: 15),
                          Text(
                            "52KG",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CompleteProfileCard(),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Me',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Creative and passionate fashion designer with an eye for detail and a love for crafting unique, elegant styles. Dedicated to blending traditional charm with modern trends, I find joy in designing outfits that inspire confidence and grace. Outside work, I enjoy exploring art, culture, and meaningful connections.",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.3,
                      ),
                      itemCount: images.length > 4 ? 4 : images.length,
                      itemBuilder: (context, index) {
                        return images.length > 4
                            ? index == 3
                                ? Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ImageCard(image: images[index]),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.black.withAlpha(150),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.image_outlined,
                                            size: 35,
                                            color: AppColors.white,
                                          ),
                                          Text(
                                            "+${images.length - 3}",
                                            style: const TextStyle(
                                                color: AppColors.white,
                                                fontSize: 24),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                : ImageCard(image: images[index])
                            : ImageCard(image: images[index]);
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomButton(text: "Edit Profile"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            text: "Logout",
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
