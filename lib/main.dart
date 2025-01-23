import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/bottom_navigation.dart';
import 'package:inakal/features/registration/screens/image_upload_screen.dart';
import 'package:inakal/common/screen/splash_screen.dart';
import 'package:inakal/constants/app_constants.dart';

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
      // home: ImageUploadScreen()
      // home: MobileNoCheckScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: RegistrationForm(),
      home: BottomNavBarScreen()
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
