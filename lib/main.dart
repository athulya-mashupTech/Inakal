import 'package:flutter/material.dart';
import 'package:inakal/common/screen/splash_screen.dart';
import 'package:inakal/common/widgets/registrationform.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 246, 17, 101)),
        useMaterial3: true,
      ),
      // home: MobileNoCheckScreen(),
     home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //  home: RegistrationForm(),
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
