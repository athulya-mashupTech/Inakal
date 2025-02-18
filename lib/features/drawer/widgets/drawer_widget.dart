import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/screens/about_us.dart';
import 'package:inakal/features/drawer/screens/edit_profile.dart';
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
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text(title),
          content: Text(content),
          actions: [
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                onConfirm(); 
              },
              child: const Text('Confirm'),
            ),
          ],
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
                        backgroundImage: AssetImage("assets/vectors/harsha1.jpg"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harsha Sreekanth',
                            style: TextStyle(color: AppColors.white, fontSize: 18),
                          ),
                          Text(
                            'INK3929',
                            style: TextStyle(color: AppColors.white, fontSize: 14),
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
                        builder: (context) => const EditProfile(),
                      ),
                    );
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
                        builder: (context) => const Notifications(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Subscriptions',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(FontAwesomeIcons.boxOpen, color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Subscriptions(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Help & Support',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(FontAwesomeIcons.headset, color: AppColors.white),
                  onTap: () {

                  },
                ),
                ListTile(
                  title: const Text('Terms & Conditions',
                      style: TextStyle(color: AppColors.white)),
                  leading: const Icon(FontAwesomeIcons.fileSignature, color: AppColors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsConditions(),
                      ),
                    );
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
                      onConfirm: () {
                      },
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
                      content: "Do you really want to delete your account from inakal?",
                      onConfirm: () {
                      },
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
                        builder: (context) => const AboutUs(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
