import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final int index;
  final int selectedIndex;
  final String label;
  final String icon;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: AppDimensions.r24,
              height: AppDimensions.r24,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColor.kPrimaryPink : AppColor.kColorOnboarding,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: AppDimensions.h4),
            Text(
              label,
              style: Styling.textNavBar.copyWith(
                color: isSelected
                    ? AppColor.kPrimaryPink
                    : AppColor.kColorOnboarding,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
