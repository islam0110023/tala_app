import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.h52,
      decoration: BoxDecoration(
        color: AppColor.kChatFieldColor,
        borderRadius: BorderRadius.circular(AppDimensions.r20),
        boxShadow: const [
          BoxShadow(
            color: AppColor.kBorderShadowColor,
            blurRadius: 14,
            offset: Offset(5, 5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: Styling.searchHintStyle,
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          contentPadding:  EdgeInsets.symmetric(vertical: AppDimensions.r15),
        ),
      ),
    );
  }
}
