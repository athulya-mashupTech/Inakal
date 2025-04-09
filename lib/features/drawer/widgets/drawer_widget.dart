import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/screens/about_us.dart';
import 'package:inakal/features/drawer/screens/edit_profile.dart';
import 'package:inakal/features/drawer/screens/gallery_page.dart';
import 'package:inakal/features/drawer/screens/notifications.dart';
import 'package:inakal/features/drawer/screens/subscriptions.dart';
import 'package:inakal/features/drawer/screens/terms_conditions.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

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
                    color: AppColors.softPink.withOpacity(0.5),
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
                            color: AppColors.black.withOpacity(0.1),
                            fontSize: 20),
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryRed,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset("assets/logo/inakal_logo.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage("assets/vectors/harsha1.jpg"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harsha Sreekanth',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 18),
                          ),
                          Text(
                            'INK3929',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text('Edit Profile',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(Icons.edit, color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                ),
                ListTile(
                  title: const Text('Gallery',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(Icons.image, color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GalleryPage()));
                  },
                ),
                ListTile(
                  title: const Text('Notifications',
                      style: TextStyle(color: AppColors.white)),
                  leading:
                      const Icon(Icons.notifications, color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const Notifications()));
                  },
                ),
                ListTile(
                  title: const Text('Subscriptions',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(FontAwesomeIcons.boxOpen,
                      color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const Subscriptions()));
                  },
                ),
                ListTile(
                  title: const Text('Help & Support',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(FontAwesomeIcons.headset,
                      color: AppColors.white),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Terms & Conditions',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(FontAwesomeIcons.fileSignature,
                      color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const TermsConditions()));
                  },
                ),
                ListTile(
                  title: const Text('Logout',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(Icons.logout, color: AppColors.white),
                  onTap: () {
                    _showConfirmationDialog(
                      context: context,
                      title: "Are you Sure?",
                      content: "Do you really want to logout from inakal.com?",
                      onConfirm: () {},
                    );
                  },
                ),
                ListTile(
                  title: const Text('Delete Account',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(Icons.delete, color: AppColors.white),
                  onTap: () {
                    _showConfirmationDialog(
                      context: context,
                      title: "Are you Sure?",
                      content:
                          "Do you really want to delete your account from inakal?",
                      onConfirm: () {},
                    );
                  },
                ),
                ListTile(
                  title: const Text('About Us',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(Icons.info, color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUs()));
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
