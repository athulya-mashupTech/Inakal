import 'package:flutter/material.dart';
import 'package:inakal/constants/app_constants.dart';
import 'package:inakal/features/home/screens/home_screen.dart';
import 'package:inakal/features/profile/screens/profile_screen.dart';
import 'package:inakal/features/psychologists_listing/screens/psychologists_screen.dart';
import 'package:inakal/features/requests/screens/request_listing_screen.dart';
import 'package:inakal/features/tailored_matches/screens/matches_screen.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          PsychologistsScreen(),
          MatchesScreen(),
          RequestListingScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        padding: const EdgeInsets.all(8),
        // backgroundColor: Colors.white,
        snakeViewColor: AppColors.primaryRed,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.primaryRed,
        // height: 70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology_outlined),
            label: 'Psychologists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        // elevation: 20,
      ),
    );
  }
}