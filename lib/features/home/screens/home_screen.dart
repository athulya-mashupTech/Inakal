import 'package:flutter/material.dart';
import 'package:inakal/common/screen/mobile_check_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MobileNoCheckScreen();
  }
}
