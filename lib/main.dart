import 'package:flutter/material.dart';
import 'package:inakal/common/screen/splash_screen.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/drawer/screens/about_us.dart';
import 'package:inakal/features/drawer/screens/notifications.dart';
import 'package:inakal/features/drawer/widgets/custom_icon.dart';
import 'package:inakal/features/home/screens/filter_screen.dart';
import 'package:inakal/features/profile/screens/profile_screen.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';
import 'package:inakal/features/psychologists_listing/screens/counsellors_screen.dart';
import 'package:inakal/features/psychologists_listing/screens/psychologists_screen.dart';
import 'package:inakal/features/registration/screens/registration_description.dart';
import 'package:inakal/features/registration/screens/registration_password.dart';
import 'package:inakal/features/registration/screens/registrationform.dart';
import 'package:inakal/features/requests/screens/request_listing_screen.dart';
import 'package:inakal/features/requests/screens/send_requests.dart';
import 'package:inakal/features/tailored_matches/screens/matches_screen.dart';
import 'package:inakal/features/home/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),   
        useMaterial3: true,
      ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: PsychologistScreen(),
        // home: BottomNavBarScreen()
        // home: MatchesScreen(),
        // home: ProfilePage(),
        // home: Notifications()
        // home: const AboutUs(),
        // home: CounsellorsScreen(),
        // home: RegistrationForm()
        // home: HomeScreen(),
        home: const RegistrationPassword(),
        home: FilterScreen(),
        // home: const RegistrationDescription(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
