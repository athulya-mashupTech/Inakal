import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:inakal/features/home/model/related_profile_model.dart';
import 'package:inakal/features/home/service/home_service.dart';
import 'package:inakal/features/home/widgets/user_card.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';
import 'package:lottie/lottie.dart';

class LikedProfile extends StatefulWidget {
  const LikedProfile({super.key});

  @override
  State<LikedProfile> createState() => _LikedProfileState();
}

class _LikedProfileState extends State<LikedProfile> {
  RelatedProfileModel? relatedProfileModel;
  bool isLoading = true;
  // final userController = Get.find<UserDataController>();

  @override
  void initState() {
    super.initState();
    fetchRelatedProfiles();
  }

  Future<void> fetchRelatedProfiles() async {
    HomeService().getRelatedProfile(context: context).then((value) {
      if (value != null) {
        setState(() {
          relatedProfileModel = value;
          isLoading = false;
        });
      }
    });
  }

  String getLocation(String district, String state) {
    if (district != "" && state != "") {
      return "$district, $state";
    } else if (district == "" && state != "") {
      return state;
    } else if (district != "" && state == "") {
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Liked Profile",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              // color: AppColors.primaryRed
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  //To move the butterfly little down
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Positioned(
                                    top: 10,
                                    child: Transform.rotate(
                                      angle: -0.5,
                                      child: const Align(
                                        alignment: Alignment.bottomRight,
                                        child: const Opacity(
                                          opacity: 0.6,
                                          child: Iconify(
                                            Ph.butterfly_duotone,
                                            size: 14,
                                            color: AppColors.primaryRed,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Transform.rotate(
                                angle: 0.5,
                                child: const Align(
                                  child: Opacity(
                                    opacity: 0.6,
                                    child: Iconify(
                                      Ph.butterfly_duotone,
                                      size: 16,
                                      color: AppColors.primaryRed,
                                    ),
                                  ),
                                  alignment: Alignment.topRight,
                                ),
                              ),
                            ],
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
                      : relatedProfileModel?.relatedProfiles?.isEmpty ?? true
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.5, // Adjust based on how much header content there is
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
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Center(
                                        child: Text(
                                          "No Related Profiles Found for your preferences.\nTry changing your preferences or check back later.",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
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
                                  crossAxisCount: 2, // Number of columns
                                  crossAxisSpacing:
                                      10, // Spacing between columns
                                  mainAxisSpacing: 10, // Spacing between rows
                                  childAspectRatio:
                                      1, // Adjust based on card dimensions
                                ),
                                itemCount: relatedProfileModel
                                    ?.relatedProfiles?.length,
                                itemBuilder: (context, index) {
                                  if (relatedProfileModel!
                                          .relatedProfiles![index].likedBy ==
                                      "1")
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OtherProfileScreen(
                                                          id: relatedProfileModel!
                                                              .relatedProfiles![
                                                                  index]
                                                              .id!)));
                                        },
                                        child: UserCard(
                                            likedBy: relatedProfileModel
                                                    ?.relatedProfiles?[index]
                                                    .likedBy ??
                                                "NO",
                                            dob: relatedProfileModel
                                                    ?.relatedProfiles?[index]
                                                    .dob ??
                                                "",
                                            clientId: relatedProfileModel
                                                    ?.relatedProfiles?[index]
                                                    .id ??
                                                "",
                                            name:
                                                "${(relatedProfileModel?.relatedProfiles?[index].firstName ?? "").trimLeft()} ${(relatedProfileModel?.relatedProfiles?[index].lastName ?? "").trimLeft()}",
                                            location: getLocation(relatedProfileModel?.relatedProfiles?[index].districtName ?? "", relatedProfileModel?.relatedProfiles?[index].stateName ?? ""),
                                            image: relatedProfileModel
                                                    ?.relatedProfiles?[index]
                                                    .image ==
                                                "https://etutor.s3.ap-south-1.amazonaws.com/users/avatar.png"
                                            ? "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg"
                                            : "${relatedProfileModel?.relatedProfiles?[index].image}"));
                                },
                              ),
                            ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
