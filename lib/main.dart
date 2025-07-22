import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inakal/common/controller/user_data_controller.dart';
import 'package:inakal/common/screen/splash_screen.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/auth/controller/auth_controller.dart';
import 'package:inakal/features/auth/registration/screens/registrationform.dart';
import 'package:inakal/features/drawer/screens/subscriptions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage

  // Register your controller globally
  Get.put(AuthController());
  Get.put(UserDataController());

  runApp(const MyApp());
}

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
      home: const MyHomePage(title: 'Inakal'),
      // home: Subscriptions(),
      // home: FilteredProfileScreen(FilterProfileModel(totalRows: "254")),
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
