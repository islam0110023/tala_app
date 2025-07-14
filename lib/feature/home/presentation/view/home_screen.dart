import 'package:flutter/material.dart';
import 'package:tala_app/feature/chat/presentation/view/chats_screen.dart';
import 'package:tala_app/feature/home/presentation/view/widget/bottom_nav_bar_body.dart';
import 'package:tala_app/feature/home/presentation/view/widget/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeScreenBody(),
    Placeholder(),
    ChatsScreen(),
    Placeholder(),
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onTap,
      ),
    );
  }
}
