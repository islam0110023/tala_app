import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/home/presentation/view/widget/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: const HomeScreenBody(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 16,
              offset: Offset(-4, -4),
              spreadRadius: 0,
            )
          ],
        ),
        height: 90,

        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              isSelected: selectedIndex == 0,
              icon: SvgPicture.asset(
                AppImage.kHomeIcon,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 0 ? const Color(0xffDB0165) : const Color(0xff530B6B),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            GestureDetector(
              onTap: () => onTap(1),
              child: Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 16,
                      offset: Offset(-4, -4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    AppImage.kTalaLogoNav,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
            _buildNavItem(
              index: 2,
              isSelected: selectedIndex == 2,
              icon: SvgPicture.asset(
                AppImage.kChatIcon,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 3 ? const Color(0xffDB0165) : const Color(0xff530B6B),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Chat',
            ),
            _buildNavItem(
              index: 3,
              isSelected: selectedIndex == 3,
              icon: SvgPicture.asset(
                AppImage.kProfileIcon,
                colorFilter: ColorFilter.mode(
                  selectedIndex == 4 ? const Color(0xffDB0165) : const Color(0xff530B6B),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required bool isSelected,
    required Widget icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xffDB0165) : const Color(0xff530B6B),
            ),
          ),
        ],
      ),
    );
  }
}
