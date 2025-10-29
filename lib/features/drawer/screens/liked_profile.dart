import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:inakal/features/drawer/model/liked_profile_model.dart';
import 'package:inakal/features/drawer/service/liked_profile_service.dart';
import 'package:inakal/features/home/widgets/user_card.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';
import 'package:lottie/lottie.dart';

class LikedProfile extends StatefulWidget {
  const LikedProfile({super.key});

  @override
  State<LikedProfile> createState() => _LikedProfileState();
}

class _LikedProfileState extends State<LikedProfile> {
  LikedProfileModel? likedProfileModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getLikedProfile();
  }

  Future<void> getLikedProfile() async {
    await LikedProfileService().getLikedProfile(context: context).then((value) {
      if (value != null) {
        setState(() {
          likedProfileModel = value;
          isLoading = false;
        });
      }
    });
  }

  String getLocation(String district, String state) {
    if (district.isNotEmpty && state.isNotEmpty) {
      return "$district, $state";
    } else if (state.isNotEmpty) {
      return state;
    } else if (district.isNotEmpty) {
      return district;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.white,
          ),
          LightPinkGradient(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Liked Profile",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Transform.rotate(
                            angle: -0.5,
                            child: Opacity(
                              opacity: 0.6,
                              child: Iconify(
                                Ph.butterfly_duotone,
                                size: 14,
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Transform.rotate(
                            angle: 0.5,
                            child: Opacity(
                              opacity: 0.6,
                              child: Iconify(
                                Ph.butterfly_duotone,
                                size: 16,
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryRed,
                          ),
                        )
                      : likedProfileModel?.relatedProfiles?.isEmpty ?? true
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      "assets/lottie/empty_data.json",
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                    ),
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Center(
                                        child: Text(
                                          "No Liked Profiles Found for your preferences.\nTry changing your preferences or check back later.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 25),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                itemCount:
                                    likedProfileModel?.relatedProfiles?.length,
                                itemBuilder: (context, index) {
                                  final profile =
                                      likedProfileModel!.relatedProfiles![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OtherProfileScreen(
                                                  id: profile.id!),
                                        ),
                                      );
                                    },
                                    child: UserCard(
                                      likedBy: profile.liked ?? false,
                                      dob: profile.dob ?? "",
                                      clientId: profile.id ?? "",
                                      name:
                                          "${(profile.firstName ?? "").trimLeft()} ${(profile.lastName ?? "").trimLeft()}",
                                      location: getLocation(
                                          profile.districtName ?? "",
                                          profile.stateName ?? ""),
                                      image: profile.image ==
                                              "https://etutor.s3.ap-south-1.amazonaws.com/users/avatar.png"
                                          ? "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg"
                                          : profile.image ?? "",
                                    ),
                                  );
                                },
                              ),
                            ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
