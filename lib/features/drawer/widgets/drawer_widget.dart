import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';

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
            title: const Text('Profile', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.person, color: AppColors.white),
            onTap: () {
              Navigator.pop(context); // Close drawer after navigation
              // Navigate to the profile page if required
            },
          ),
          ListTile(
            title: const Text('Settings', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.settings, color: AppColors.white),
            onTap: () {
              Navigator.pop(context); // Close drawer after navigation
              // Navigate to settings page
            },
          ),
          ListTile(
            title: const Text('Logout', style: TextStyle(color: AppColors.white)),
            leading: const Icon(Icons.logout, color: AppColors.white),
            onTap: () {
              Navigator.pop(context); 
              // Handle logout logic
            },
          ),
        ],
      ),
    );
  }
}
