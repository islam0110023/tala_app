import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class CustomHomeSearch extends StatelessWidget {
  const CustomHomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.r25),
          boxShadow: const [
            BoxShadow(
              color: AppColor.kBoxShadowColor,
              blurRadius: 15,
              offset: Offset(8, 8),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.r25),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.r25),
              borderSide: BorderSide(
                color: AppColor.kPrimaryPink,
                width: AppDimensions.r2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimensions.r25),
              borderSide: BorderSide(
                color: AppColor.kPrimaryPink,
                width: AppDimensions.r2,
              ),
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            hintText: 'Search...',
            hintStyle: Styling.searchHomeHintStyle,
          ),
        ),
      ),
    );
  }
}
