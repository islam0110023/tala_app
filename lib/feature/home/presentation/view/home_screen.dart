import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/feature/chat/presentation/view/chats_screen.dart';
import 'package:tala_app/feature/dating/presentation/view/dating_screen.dart';
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

  List<bool> isPageInitialized = [true, false, false, false];
  @override
  void initState() {
    super.initState();
  }


  void onTap(int index) {
    setState(() {
      selectedIndex = index;
      isPageInitialized[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: [
          const HomeScreenBody(),
          isPageInitialized[1] ? const DatingScreen() : const SizedBox(),
          isPageInitialized[2] ? const ChatsScreen() : const SizedBox(),
          isPageInitialized[3] ? const ProfileHomePage() : const SizedBox(),
        ],
        sizing: StackFit.expand,
      ),
      backgroundColor: (selectedIndex == 3)
          ? AppColor.kProfileScaffold
          : Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onTap: onTap,
      ),
    );
  }
}
