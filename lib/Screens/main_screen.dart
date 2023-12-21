import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_bloc/Screens/badoScreen.dart';
import 'package:flutter_firebase_bloc/Screens/community_screen.dart';
import 'package:flutter_firebase_bloc/Screens/home_screen.dart';
import 'package:flutter_firebase_bloc/Screens/post_screen.dart';
import 'package:flutter_firebase_bloc/Screens/profile_screen.dart';
import 'package:iconly/iconly.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  List pages = const [
    HomeScreen(),
    BadoScreen(),
    CommunityScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedTab],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: CrystalNavigationBar(
          currentIndex: _selectedTab,
          // indicatorColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          // outlineBorderColor: Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,

          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.white,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: IconlyBold.user_2,
              unselectedIcon: IconlyLight.user_1,
              selectedColor: Colors.red,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: IconlyBold.plus,
              unselectedIcon: IconlyLight.plus,
              selectedColor: Colors.white,
            ),

            /// Search
            CrystalNavigationBarItem(
                icon: IconlyBold.chat,
                unselectedIcon: IconlyLight.search,
                selectedColor: Colors.white),

            /// Profile
            CrystalNavigationBarItem(
              icon: IconlyBold.user_2,
              unselectedIcon: IconlyLight.user,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
