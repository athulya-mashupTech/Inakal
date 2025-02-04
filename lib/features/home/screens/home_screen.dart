import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/bi.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/common/widgets/complete_profile_card.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/home/widgets/user_card.dart';
import 'package:inakal/features/profile/screens/other_profile_screen.dart';
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
        title: Image.asset("assets/logo/inakal_logo.png", height: 30,),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: IconButton(icon: Iconify(Ph.chats_circle_fill, size: 26, color: AppColors.primaryRed,), onPressed: () {},),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_rounded, color: AppColors.primaryRed)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CompleteProfileCard(),
            ),
            // Text("Home Page"),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtherProfileScreen()));
                    },
                    child: UserCard(
                        name: users[index].name,
                        location: users[index].location,
                        image: users[index].image));
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
