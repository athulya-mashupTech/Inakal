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
import 'package:inakal/features/drawer/screens/edit_profile.dart';
import 'package:inakal/features/drawer/widgets/drawer_widget.dart';
import 'package:inakal/features/profile/widgets/image_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final box = GetStorage();
  bool isLoading = false;
  final userController = Get.find<UserDataController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String>? allImages = [];
  final List<String> images = [
    "assets/vectors/harsha1.jpg",
    "assets/vectors/harsha2.jpg",
    "assets/vectors/harsha3.jpg",
    "assets/vectors/harsha4.jpg",
    "assets/vectors/harsha1.jpg"
  ];

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
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 22.0, horizontal: 25),
                  child: Column(
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
                          SizedBox(
                            width: 5,
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
                                      )))),
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
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              content,
                              style: const TextStyle(
                                  fontSize: 16, color: AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.softPink.withAlpha(50),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Cancel"),
                        ),
                      ),
                      Text(
                        " | ",
                        style: TextStyle(
                            color: AppColors.black.withAlpha(50), fontSize: 20),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onConfirm();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text("Confirm",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showImageOverlay(int index) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: PageView.builder(
                    itemCount: allImages!.length,
                    controller: PageController(initialPage: index),
                    itemBuilder: (context, i) {
                      return Image.network(
                        allImages![i],
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int calculateAge(String birthDateString) {
    DateTime birthDate = DateTime.parse(birthDateString);
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;

    // Check if the birthday has occurred yet this year
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
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Stack(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Center(
                                child: RichText(
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
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.widgets_rounded,
                                  size: 28,
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState!.openEndDrawer();
                                },
                                color: AppColors.primaryRed,
                              ),
                            ],
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
                                    child: Image.network(
                                      userController
                                              .userData.value.user?.image ??
                                          "https://i.pinimg.com/736x/dc/9c/61/dc9c614e3007080a5aff36aebb949474.jpg",
                                      width: 160,
                                      height: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => Text(
                                              userController.userData.value.user
                                                          ?.id !=
                                                      null
                                                  ? "Inakal ID: ${userController.userData.value.user?.id}"
                                                  : "Inakal ID Loading...",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.primaryRed),
                                            )),
                                        Obx(() => Text(
                                              userController.userData.value.user
                                                          ?.firstName !=
                                                      null
                                                  ? "${userController.userData.value.user?.firstName} ${userController.userData.value.user?.lastName}"
                                                  : "Name Loading...",
                                              style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.1),
                                            )),
                                        Obx(() => Text(
                                              userController.userData.value.user
                                                          ?.currentCity !=
                                                      null
                                                  ? "${userController.userData.value.user?.currentCity}, ${userController.userData.value.user?.district}"
                                                  : "Location loading ...",
                                              style: TextStyle(fontSize: 16),
                                            )),
                                        SizedBox(height: 8),
                                        Obx(() => Text(
                                              userController.userData.value.user
                                                          ?.occupation !=
                                                      null
                                                  ? "${userController.userData.value.user?.occupation}"
                                                  : "Job is Loading...",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                        Obx(() => Text(
                                              userController.userData.value.user
                                                          ?.religion !=
                                                      null
                                                  ? "${userController.userData.value.user?.religion}"
                                                  : "Religion is loading",
                                              style: TextStyle(fontSize: 16),
                                            )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Iconify(
                                  Mdi.numbers,
                                  color: AppColors.primaryRed,
                                  size: 21,
                                ),
                                SizedBox(width: 5),
                                Obx(() => Text(
                                      userController.userData.value.user?.dob !=
                                              null
                                          ? "${calculateAge(userController.userData.value.user?.dob ?? "")} Years"
                                          : "...",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.black,
                                      ),
                                    )),
                                SizedBox(width: 12),
                                Iconify(
                                  Mdi.human_male_height_variant,
                                  color: AppColors.primaryRed,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Obx(() => Text(
                                      userController.userData.value.user
                                                  ?.height !=
                                              null
                                          ? "${userController.userData.value.user?.height}"
                                          : "...",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.black,
                                      ),
                                    )),
                                SizedBox(width: 12),
                                Iconify(Mdi.weight_lifter,
                                    color: AppColors.primaryRed, size: 15),
                                SizedBox(width: 5),
                                Obx(() => Text(
                                      userController.userData.value.user
                                                  ?.weight !=
                                              null
                                          ? "${userController.userData.value.user?.weight}"
                                          : "...",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.black,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const CompleteProfileCard(),
                          Padding(
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
                                Obx(() => Text(
                                      userController.userData.value.user
                                                  ?.aboutMe !=
                                              null
                                          ? "${userController.userData.value.user?.aboutMe}"
                                          : "Description is Loading",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.black,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.3,
                              ),
                              itemCount:
                                  allImages!.length > 4 ? 4 : allImages?.length,
                              itemBuilder: (context, index) {
                                return allImages!.length > 4
                                    ? index == 3
                                        ? GestureDetector(
                                            onTap: () {
                                              _showImageOverlay(3);
                                            },
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                ImageCard(
                                                    image: allImages![index]),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: AppColors.black
                                                        .withAlpha(150),
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
                                                      "+${allImages!.length - 3}",
                                                      style: const TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 24),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        : GestureDetector(
                                            child: ImageCard(
                                                image: allImages![index]),
                                            onTap: () {
                                              _showImageOverlay(index);
                                            },
                                          )
                                    : GestureDetector(
                                        child:
                                            ImageCard(image: allImages![index]),
                                        onTap: () {
                                          _showImageOverlay(index);
                                        },
                                      );
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CustomButton(
                                    text: "Edit Profile",
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditProfile()));
                                    }),
                                const SizedBox(
                                  height: 10,
                                ),
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
                                        Get.offAll(() => const LoginPage());
                                      },
                                    );
                                  },
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
