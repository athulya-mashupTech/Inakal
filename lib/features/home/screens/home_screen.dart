import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/complete_profile_card.dart';
import 'package:inakal/features/home/widgets/user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CompleteProfileCard(),
            // Text("Home Page"),
            SizedBox(height: 10),
            UserCard(),
            UserCard(),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
