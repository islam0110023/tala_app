import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        style: Styling.searchHintStyle,
        decoration: InputDecoration(
          hintText: LocaleKeys.search.tr(),
          hintStyle: Styling.searchHintStyle,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.r11),
            child: Icon(Icons.search, size: AppDimensions.r24),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: AppDimensions.r15),
        ),
      ),
    );
  }
}
