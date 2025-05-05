import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/complete_profile_card.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/chat/screens/inbox_screen.dart';
import 'package:inakal/features/home/model/related_profile_model.dart';
import 'package:inakal/features/home/screens/filter_screen.dart';
import 'package:inakal/features/home/service/home_service.dart';
import 'package:inakal/features/home/widgets/user_card.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo/inakal_logo.png",
          height: 30,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: IconButton(
            icon: const Iconify(
              Ph.chats_circle_fill,
              size: 26,
              color: AppColors.primaryRed,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InboxScreen()));
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FilterScreen()));
                },
                icon: const Icon(Icons.filter_alt_rounded,
                    color: AppColors.primaryRed)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CompleteProfileCard(),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Related Profile",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        // color: AppColors.primaryRed
                      ),
                    ),
                    Text(
                      "Find Your Soulmate Among Our Handpicked Recommendations",
                      style: TextStyle(
                          // fontSize: 25,
                          // fontWeight: FontWeight.bold,
                          // // color: AppColors.primaryRed
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryRed,
                    ),
                  )
                : relatedProfileModel?.relatedProfiles?.isEmpty ?? true
                    ? const Center(
                        child: Text("No Related Profiles Found"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: relatedProfileModel?.relatedProfiles?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OtherProfileScreen()));
                              },
                              child: UserCard(
                                  name:
                                      "${relatedProfileModel?.relatedProfiles?[index].firstName} ${relatedProfileModel?.relatedProfiles?[index].lastName}",
                                  location:
                                      "${relatedProfileModel?.relatedProfiles?[index].district} ${relatedProfileModel?.relatedProfiles?[index].state}",
                                  image:
                                      "${relatedProfileModel?.relatedProfiles?[index].image}"));
                        },
                      ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
