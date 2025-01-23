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
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.white,
        snakeViewColor: AppColors.primaryRed,
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.grey,
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
        elevation: 10,
      ),
    );
  }
}

//Bottom Navigation Bar 2
// import 'package:flutter/material.dart';
// import 'package:inakal/constants/app_constants.dart';
// import 'package:inakal/features/home/screens/home_screen.dart';
// import 'package:inakal/features/profile/screens/profile_screen.dart';
// import 'package:inakal/features/psychologists_listing/screens/psychologists_screen.dart';
// import 'package:inakal/features/requests/screens/request_listing_screen.dart';
// import 'package:inakal/features/tailored_matches/screens/matches_screen.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({super.key});

//   @override
//   _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         children: const [
//           HomeScreen(),
//           PsychologistsScreen(),
//           MatchesScreen(),
//           RequestListingScreen(),
//           ProfileScreen(),
//         ],
//       ),
//       bottomNavigationBar: DotNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           DotNavigationBarItem(
//             icon: const Icon(Icons.home_outlined),
//             selectedColor: AppColors.primaryRed,
//           ),
//           DotNavigationBarItem(
//             icon: const Icon(Icons.psychology_outlined),
//             selectedColor: AppColors.primaryRed,
//           ),
//           DotNavigationBarItem(
//             icon: const Icon(Icons.favorite_outline),
//             selectedColor: AppColors.primaryRed,
//           ),
//           DotNavigationBarItem(
//             icon: const Icon(Icons.chat_outlined),
//             selectedColor: AppColors.primaryRed,
//           ),
//           DotNavigationBarItem(
//             icon: const Icon(Icons.person_outline),
//             selectedColor: AppColors.primaryRed,
//           ),
//         ],
//       ),
//     );
//   }
// }


//Bottom Navigation 3
// import 'package:flutter/material.dart';
// import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
// import 'package:inakal/constants/app_constants.dart';
// import 'package:inakal/features/home/screens/home_screen.dart';
// import 'package:inakal/features/profile/screens/profile_screen.dart';
// import 'package:inakal/features/psychologists_listing/screens/psychologists_screen.dart';
// import 'package:inakal/features/requests/screens/request_listing_screen.dart';
// import 'package:inakal/features/tailored_matches/screens/matches_screen.dart';

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({super.key});

//   @override
//   _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   int _selectedIndex = 0;

//   final PageController _pageController = PageController();

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         children: const [
//           HomeScreen(),
//           PsychologistsScreen(),
//           MatchesScreen(),
//           RequestListingScreen(),
//           ProfileScreen(),
//         ],
//       ),
//       bottomNavigationBar: CrystalNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         height: 60,  // Adjust the height of the navigation bar
//         selectedItemColor: AppColors.primaryRed,  // Background color of the bar
//         items: [
//           CrystalNavigationBarItem(
//             unselectedIcon: Icons.home_outlined,
//             icon: Icons.home,
//           ),
//           CrystalNavigationBarItem(
//             unselectedIcon: Icons.psychology_outlined,
//             icon: Icons.psychology,
//           ),
//           CrystalNavigationBarItem(
//             unselectedIcon: Icons.favorite_outline,
//             icon: Icons.favorite,
//           ),
//           CrystalNavigationBarItem(
//             unselectedIcon: Icons.chat_outlined,
//             icon: Icons.chat,
//           ),
//           CrystalNavigationBarItem(
//             unselectedIcon: Icons.person_outline,
//             icon: Icons.person,
//           ),
//         ],
//       ),
//     );
//   }
// }

// Bottom Bar 4
// import 'package:flutter/material.dart';
// import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
// import 'package:inakal/constants/app_constants.dart';
// import 'package:inakal/features/home/screens/home_screen.dart';
// import 'package:inakal/features/profile/screens/profile_screen.dart';
// import 'package:inakal/features/psychologists_listing/screens/psychologists_screen.dart';
// import 'package:inakal/features/requests/screens/request_listing_screen.dart';
// import 'package:inakal/features/tailored_matches/screens/matches_screen.dart';

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({Key? key}) : super(key: key);

//   @override
//   State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         children: const [
//           HomeScreen(),
//           PsychologistsScreen(),
//           MatchesScreen(),
//           RequestListingScreen(),
//           ProfileScreen(),
//         ],
//       ),
//       bottomNavigationBar: SlidingClippedNavBar(
//         selectedIndex: _selectedIndex,
//         onButtonPressed: _onItemTapped,
//         backgroundColor: Colors.white,
//         activeColor: AppColors.primaryRed,
//         inactiveColor: AppColors.grey,
//         barItems: [
//           BarItem(
//             icon: Icons.home_outlined,
//             title: 'Home',
//           ),
//           BarItem(
//             icon: Icons.psychology_outlined,
//             title: 'Psychologists',
//           ),
//           BarItem(
//             icon: Icons.favorite_outline,
//             title: 'Matches',
//           ),
//           BarItem(
//             icon: Icons.chat_outlined,
//             title: 'Requests',
//           ),
//         ],
//       ),
//     );
//   }
// }


// Bottom Bar 5
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:inakal/constants/app_constants.dart';
// import 'package:inakal/features/home/screens/home_screen.dart';
// import 'package:inakal/features/profile/screens/profile_screen.dart';
// import 'package:inakal/features/psychologists_listing/screens/psychologists_screen.dart';
// import 'package:inakal/features/requests/screens/request_listing_screen.dart';
// import 'package:inakal/features/tailored_matches/screens/matches_screen.dart';

// class BottomNavBarScreen extends StatefulWidget {
//   const BottomNavBarScreen({Key? key}) : super(key: key);

//   @override
//   State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
// }

// class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
//   final NotchBottomBarController _controller = NotchBottomBarController(index: 0);
//   final PageController _pageController = PageController(); // Use your own PageController

//   final List<Widget> _pages = const [
//     HomeScreen(),
//     PsychologistsScreen(),
//     MatchesScreen(),
//     RequestListingScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController, // Use the custom PageController
//         physics: const NeverScrollableScrollPhysics(), // Prevent swiping between pages
//         children: _pages,
//       ),
//       bottomNavigationBar: AnimatedNotchBottomBar(
//         notchBottomBarController: _controller,
//         showLabel: true,
//         onTap: (index) {
//           _pageController.jumpToPage(index); // Navigate using the custom PageController
//           _controller.jumpTo(index);
//           setState(() {});
//         },
//         kIconSize: 20, // Adjust icon size
//         kBottomRadius: 20, // Adjust the bottom radius of the bar
//         notchColor: Colors.white,
//         bottomBarItems: const [
//           BottomBarItem(
//             inActiveItem: Icon(Icons.home_outlined, color: AppColors.grey),
//             activeItem: Icon(Icons.home, color: AppColors.primaryRed),
//             itemLabel: 'Home',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(Icons.psychology_outlined, color: AppColors.grey),
//             activeItem: Icon(Icons.psychology, color: AppColors.primaryRed),
//             itemLabel: 'Psychologists',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(Icons.favorite_outline, color: AppColors.grey),
//             activeItem: Icon(Icons.favorite, color: AppColors.primaryRed),
//             itemLabel: 'Matches',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(Icons.chat_outlined, color: AppColors.grey),
//             activeItem: Icon(Icons.chat, color: Colors.white),
//             itemLabel: 'Requests',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(Icons.person_outline, color: AppColors.grey),
//             activeItem: Icon(Icons.person, color: Colors.white),
//             itemLabel: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose(); // Dispose the PageController
//     super.dispose();
//   }
// }
