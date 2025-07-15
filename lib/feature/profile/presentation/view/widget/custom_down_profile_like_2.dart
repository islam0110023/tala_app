import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomDownProfileLike2 extends StatelessWidget {
  const CustomDownProfileLike2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  AppDimensions.r25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(onTap: () {}, name: LocaleKeys.next.tr()),
          SizedBox(height: AppDimensions.h20),
        ],
      ),
    );
  }
}
