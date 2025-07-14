import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_nav_item.dart';

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
    return Container(
      height: AppDimensions.h90,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.r24),
          topRight: Radius.circular(AppDimensions.r24),
        ),
        color: AppColor.kWhite1,
        boxShadow: const [
          BoxShadow(
            color: AppColor.kBlack25,
            blurRadius: 30,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavItem(
            index: 0,
            selectedIndex: selectedIndex,
            label: 'Home',
            icon: AppImage.kHomeIcon,
            onTap: onTap,
          ),
          Expanded(
            child: InkWell(
              onTap: () => onTap(1),
              child: Container(
                width: AppDimensions.r65,
                height: AppDimensions.r65,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Image.asset(
                  selectedIndex == 1
                      ? AppImage.kTalaLogoNavHover
                      : AppImage.kTalaLogoNav,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          CustomNavItem(
            index: 2,
            selectedIndex: selectedIndex,
            label: 'Chat',
            icon: AppImage.kChatIcon,
            onTap: onTap,
          ),
          CustomNavItem(
            index: 3,
            selectedIndex: selectedIndex,
            label: 'Profile',
            icon: AppImage.kProfileIcon,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
