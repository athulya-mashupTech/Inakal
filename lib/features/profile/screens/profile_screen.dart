// ProfilePage.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/widgets/complete_profile_card.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/constants/widgets/light_pink_gradient.dart';
import 'package:inakal/features/auth/login/screens/login_page.dart';
import 'package:inakal/features/profile/screens/password_reset_screen.dart';
import 'package:inakal/features/drawer/widgets/common/drawer_widget.dart';
import 'package:inakal/features/profile/widgets/image_card.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final box = GetStorage();
  final userController = Get.find<UserDataController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  void _showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Transform.rotate(
                            angle: -0.5,
                            child: const Opacity(
                              opacity: 0.6,
                              child: Iconify(
                                Ph.butterfly_duotone,
                                size: 14,
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ),
                          Transform.rotate(
                            angle: 0.5,
                            child: const Opacity(
                              opacity: 0.6,
                              child: Iconify(
                                Ph.butterfly_duotone,
                                size: 16,
                                color: AppColors.primaryRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        content,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.softPink.withAlpha(50),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancel"),
                        ),
                      ),
                      const Text(
                        " | ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onConfirm();
                          },
                          child: const Text("Confirm"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showImageOverlay(int index) {
    final publicGallery = userController.galleryImages.value.gallery
            ?.where((image) => image.isPublic == "1")
            .toList() ??
        [];

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              itemCount: publicGallery.length,
              controller: PageController(initialPage: index),
              itemBuilder: (_, i) {
                return CachedNetworkImage(
                  imageUrl: publicGallery[i].image ?? "",
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Center(
                    child: IntrinsicHeight(
                      child: IntrinsicWidth(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  int calculateAge(String birthDateString) {
    final birthDate = DateTime.tryParse(birthDateString);
    if (birthDate == null) return 0;
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      body: Stack(
        children: [
          LightPinkGradient(),
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'My ',
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              TextSpan(
                                text: 'Profile',
                                style: TextStyle(
                                    color: AppColors.primaryRed,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.widgets_rounded,
                              color: AppColors.primaryRed),
                          onPressed: () =>
                              _scaffoldKey.currentState!.openEndDrawer(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryRed, width: 3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: userController
                                            .userData.value.user?.image ??
                                        "",
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 180,
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) => Shimmer.fromColors(
                                      baseColor: AppColors.grey,
                                      highlightColor: AppColors.lightGrey,
                                      child: Container(color: AppColors.grey),
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Obx(() {
                              final user = userController.userData.value.user;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Inakal ID: INK${user?.id ?? "Not Specified"}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.primaryRed),
                                  ),
                                  Text(
                                    "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1),
                                  ),
                                  Text(
                                    getLocation(
                                        user?.districtName ?? "",
                                        user?.stateName ?? ""),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    user?.occupationName ?? "Job Not Specified",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    user?.religionName ?? "Religion loading...",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                    Obx(() {
                      final user = userController.userData.value.user;
                      return Row(
                        children: [
                          const Iconify(Mdi.numbers,
                              color: AppColors.primaryRed, size: 21),
                          const SizedBox(width: 5),
                          Text(
                            "${calculateAge(user?.dob ?? "")} Years",
                            style: const TextStyle(
                                fontSize: 18, color: AppColors.black),
                          ),
                          const SizedBox(width: 12),
                          const Iconify(Mdi.human_male_height_variant,
                              color: AppColors.primaryRed, size: 15),
                          const SizedBox(width: 5),
                          Text("${user?.height ?? "..."} cm",
                              style: const TextStyle(
                                  fontSize: 18, color: AppColors.black)),
                          const SizedBox(width: 12),
                          const Iconify(Mdi.weight_lifter,
                              color: AppColors.primaryRed, size: 15),
                          const SizedBox(width: 5),
                          Text("${user?.weight ?? "..."} Kg",
                              style: const TextStyle(
                                  fontSize: 18, color: AppColors.black)),
                        ],
                      );
                    }),
                    const SizedBox(height: 10),
                    const CompleteProfileCard(),
                    const SizedBox(height: 20),
                    const Text('About Me',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black)),
                    const SizedBox(height: 8),
                    Obx(() => Text(
                          userController.userData.value.user?.aboutMe ??
                              "Loading...",
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.black),
                        )),
                    const SizedBox(height: 10),
                    Obx(() {
                      final publicGallery = userController
                              .galleryImages.value.gallery
                              ?.where((img) => img.isPublic == "1")
                              .toList() ??
                          [];
              
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            publicGallery.length > 4 ? 4 : publicGallery.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.3,
                        ),
                        itemBuilder: (context, index) {
                          final img = publicGallery[index];
                          return GestureDetector(
                            onTap: () => _showImageOverlay(index),
                            child: index == 3 && publicGallery.length > 4
                                ? Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ImageCard(image: img.image ?? ""),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.black.withAlpha(150),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.image_outlined,
                                              color: AppColors.white, size: 35),
                                          Text("+${publicGallery.length - 3}",
                                              style: const TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 24)),
                                        ],
                                      )
                                    ],
                                  )
                                : ImageCard(image: img.image ?? ""),
                          );
                        },
                      );
                    }),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: "Password Reset",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PasswordResetScreen()));
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: "Logout",
                      color: AppColors.black,
                      onPressed: () {
                        _showConfirmationDialog(
                          context: context,
                          title: "Are you Sure?",
                          content:
                              "Do you really want to logout from inakal.com?",
                          onConfirm: () {
                            box.write('isLoggedIn', false);
                            userController.clearAll();
                            Get.offAll(() => const LoginPage());
                          },
                        );
                      },
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
