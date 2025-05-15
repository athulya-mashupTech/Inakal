import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inakal/features/home/model/related_profile_model.dart';
import 'package:inakal/features/home/service/home_service.dart';
import 'package:inakal/features/home/widgets/user_card.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';

class LikedProfile extends StatefulWidget {
  const LikedProfile({super.key});

  @override
  State<LikedProfile> createState() => _LikedProfileState();
}


class _LikedProfileState extends State<LikedProfile> {
  RelatedProfileModel? relatedProfileModel;
  bool isLoading = true;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Text("Liked Profile",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold))),
              SizedBox(height: 20),
              GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 3, // Spacing between columns
                            mainAxisSpacing: 10, // Spacing between rows
                            childAspectRatio:
                                1, // Adjust based on card dimensions
                          ),
                          itemCount:
                              relatedProfileModel?.relatedProfiles?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OtherProfileScreen(
                                                  id: relatedProfileModel!
                                                      .relatedProfiles![index]
                                                      .id!)));
                                },
                                child: UserCard(
                                    likedBy: relatedProfileModel
                                            ?.relatedProfiles?[index].likedBy ??
                                        "NO",
                                    dob: relatedProfileModel
                                            ?.relatedProfiles?[index].dob ??
                                        "",
                                    clientId: relatedProfileModel
                                            ?.relatedProfiles?[index].id ??
                                        "",
                                    name:
                                        "${relatedProfileModel?.relatedProfiles?[index].firstName} ${relatedProfileModel?.relatedProfiles?[index].lastName}",
                                    location: relatedProfileModel
                                                    ?.relatedProfiles?[index]
                                                    .state !=
                                                null &&
                                            relatedProfileModel
                                                    ?.relatedProfiles?[index]
                                                    .state !=
                                                ""
                                        ? "${relatedProfileModel?.relatedProfiles?[index].district}, ${relatedProfileModel?.relatedProfiles?[index].state}"
                                        : "${relatedProfileModel?.relatedProfiles?[index].district}",
                                    image:
                                        "${relatedProfileModel?.relatedProfiles?[index].image}"));
                          },
                        ),
            ],
          ),

      )),
    );
  }
}