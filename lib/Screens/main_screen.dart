import 'package:flutter/material.dart';
import 'package:flutter_firebase_bloc/Screens/badoScreen.dart';
import 'package:flutter_firebase_bloc/Screens/chat_Screen.dart';
import 'package:flutter_firebase_bloc/Screens/community_screen.dart';
import 'package:flutter_firebase_bloc/Screens/home_screen.dart';
import 'package:flutter_firebase_bloc/Screens/post_screen.dart';
import 'package:flutter_firebase_bloc/Screens/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  List pages = const [
    HomeScreen(),
    CommunityScreen(),
    BadoScreen(),
    ChatScreen(),
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
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedTab,
        onTap: _handleIndexChanged,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.diversity_3_rounded),
            title: const Text("Community"),
            selectedColor: Colors.pink,
          ),

          // Add post
          SalomonBottomBarItem(
            icon: const Icon(Icons.add_circle),
            title: const Text("Add"),
            selectedColor: Colors.orange,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.chat),
            title: const Text("chat"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
