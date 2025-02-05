import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:inakal/common/widgets/complete_profile_card.dart';
import 'package:inakal/common/widgets/custom_button.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/home/screens/filter_widget.dart';
import 'package:inakal/features/home/widgets/filter_button.dart';
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
        title: Image.asset(
          "assets/logo/inakal_logo.png",
          height: 30,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: IconButton(
            icon: Iconify(
              Ph.chats_circle_fill,
              size: 26,
              color: AppColors.primaryRed,
            ),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Iconify(Mdi.instant_mix),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Filter")
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.close))
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                child: Text("ID",style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    focusColor: AppColors.primaryRed,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.primaryRed, width: 1),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(width: 1.5),),
                                    hintText: 'Search by ID',
                                    hintStyle: TextStyle(
                                        color: AppColors.grey, fontSize: 18),
                                    prefixIcon: Container(
                                      // padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: Icon(Icons.search_rounded),
                                      width: 18,
                                    ),
                                )
                              ),
                              SizedBox(height: 10),
                              FilterButton(text: "Search"),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Expanded(child: Divider()),
                                  SizedBox(width: 10),
                                  Text("or"),
                                  SizedBox(width: 10),
                                  Expanded(child: Divider()),
                                  SizedBox(width: 20)
                                ],
                              ),



                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                child: Text("Location",style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    focusColor: AppColors.primaryRed,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.primaryRed, width: 1),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(width: 1.5),),
                                    hintText: 'Search perfered location',
                                    hintStyle: TextStyle(
                                        color: AppColors.grey, fontSize: 18),
                                    prefixIcon: Container(
                                      // padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: Icon(Icons.search_rounded),
                                      width: 18,
                                    ),
                                )
                              ),

                              
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.filter_alt_rounded,
                    color: AppColors.primaryRed)),
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
