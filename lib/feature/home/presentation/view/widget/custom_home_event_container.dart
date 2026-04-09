import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_home_button.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_image_container.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_text_container_content.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomHomeEventContainer extends StatelessWidget {
  const CustomHomeEventContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColor.kContainerGradient, AppColor.kWhite1],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              border: Border.all(
                color: AppColor.kHomeContainerBorder,
                width: AppDimensions.r2,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.r20),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.r8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomImageContainer(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextContainerContent(),
                  ),
                  CustomHomeButton(
                    onTap: () {},
                    text: LocaleKeys.join_now.tr(),
                  ),
                  SizedBox(height: AppDimensions.h10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
