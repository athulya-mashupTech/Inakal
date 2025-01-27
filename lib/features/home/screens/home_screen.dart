import 'package:flutter/material.dart';
import 'package:inakal/common/widgets/complete_profile_card.dart';
import 'package:inakal/features/home/widgets/user_card.dart';
import 'package:inakal/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    users = User.getSampleUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CompleteProfileCard(),
            // Text("Home Page"),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserCard(name: users[index].name, location: users[index].location, image: users[index].image);
              },
            ),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
