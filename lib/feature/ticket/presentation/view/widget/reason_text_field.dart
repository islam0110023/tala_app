import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ReasonTextField extends StatelessWidget {
  const ReasonTextField({super.key, required this.otherController});

  final TextEditingController otherController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.r12),
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(AppDimensions.r15),
        boxShadow: const [
          BoxShadow(
            color: AppColor.kBorderShadowColor,
            blurRadius: 14,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: SizedBox(
        height: AppDimensions.h130,
        child: TextField(
          controller: otherController,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: LocaleKeys.enterYourReason.tr(),
            hintStyle: const TextStyle(color: AppColor.kGray),
          ),
        ),
      ),
    );
  }
}
