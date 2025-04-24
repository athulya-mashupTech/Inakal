import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/screen/splash_screen.dart';
import 'package:inakal/common/screen/test_page.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/chat/screens/chat_screen.dart';
import 'package:inakal/features/chat/screens/inbox_screen.dart';
import 'package:inakal/features/drawer/screens/about_us.dart';
import 'package:inakal/features/drawer/screens/edit_profile.dart';
import 'package:inakal/features/drawer/screens/gallery_page.dart';
import 'package:inakal/features/drawer/screens/notifications.dart';
import 'package:inakal/features/drawer/widgets/custom_icon.dart';
import 'package:inakal/features/home/screens/filter_screen.dart';
import 'package:inakal/features/auth/login/screens/login_page.dart';
import 'package:inakal/features/profile/screens/profile_screen.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';
import 'package:inakal/features/psychologists_listing/screens/counsellors_screen.dart';
import 'package:inakal/features/psychologists_listing/screens/psychologists_screen.dart';
import 'package:inakal/features/auth/registration/screens/image_upload_screen.dart';
import 'package:inakal/features/auth/registration/screens/registration_description.dart';
import 'package:inakal/features/auth/registration/screens/registration_password.dart';
import 'package:inakal/features/auth/registration/screens/registrationform.dart';
import 'package:inakal/features/requests/screens/request_listing_screen.dart';
import 'package:inakal/features/requests/screens/send_requests.dart';
import 'package:inakal/features/tailored_matches/screens/matches_screen.dart';
import 'package:inakal/features/home/screens/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  
  // Register your controller globally
  Get.put(AuthController());
  Get.put(UserDataController());

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     final isLoggedIn = box.read('isLoggedIn') ?? false;

//     return GetMaterialApp(
//       title: 'Inakal',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
//         useMaterial3: true,
//       ),
//       home: isLoggedIn ? const BottomNavBarScreen() : SplashScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inakal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
        useMaterial3: true,
      ),
      // home: ChatScreen(),
      // home: PsychologistScreen(),
      // home: ProfileApp(),
      home: const MyHomePage(title: 'Inakal'),
      // home: MatchesScreen(),
      // home: ProfilePage(),
      // home: Notifications()
      // home: InboxScreen(),
      // home: CounsellorsScreen(),
      // home: RegistrationForm()
      // home: HomeScreen(),
      // home: const RegistrationPassword(),
      // home: FilterScreen(),
      // home: const RegistrationDescription(),
      // home: EditProfile()
      // home: GalleryPage(),
      // home:ImageUploadScreen()
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
