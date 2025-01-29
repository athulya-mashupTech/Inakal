import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/screens/about_us.dart';
import 'package:inakal/features/drawer/screens/edit_profile.dart';
import 'package:inakal/features/drawer/screens/notifications.dart';
import 'package:inakal/features/drawer/screens/subscriptions.dart';
import 'package:inakal/features/drawer/screens/terms_conditions.dart';
import 'package:inakal/features/registration/screens/image_upload_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

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
          ListTile(
            title: const Text(' Edit Profile', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.edit, color: AppColors.white),
            onTap: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  );
            },
          ),
          ListTile(
            title: const Text('Notifications', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.notifications, color: AppColors.white),
            onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifications(),
                    ),
                  );
            },
          ),
          ListTile(
            title: const Text('Subscriptions', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.money, color: AppColors.white),
            onTap: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Subscriptions(),
                    ),
                  );
            },
          ),
            ListTile(
            title: const Text('Help & support', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.settings, color: AppColors.white),
            onTap: () {
            
            },
          ),
            ListTile(
            title: const Text('Terms & conditions', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.settings, color: AppColors.white),
            onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsConditions(),
                    ),
                  );
            },
          ),
            ListTile(
            title: const Text('Logout', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.logout, color: AppColors.white),
            onTap: () {
            
            },
          ),
            ListTile(
            title: const Text('About Us', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.info, color: AppColors.white),
            onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
            },
          ),
            
        ],
      ),
    );
  }
}
