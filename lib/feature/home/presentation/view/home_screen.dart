import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/feature/chat/presentation/view/chats_screen.dart';
import 'package:tala_app/feature/home/presentation/view/widget/bottom_nav_bar_body.dart';
import 'package:tala_app/feature/home/presentation/view/widget/home_screen_body.dart';
import 'package:tala_app/feature/profile_home/presentation/view/profile_home_page.dart';

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
    ProfileHomePage(),
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
      backgroundColor: (selectedIndex == 3)? AppColor.kProfileScaffold: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onTap,
      ),
    );
  }
}
