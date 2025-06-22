import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class DescriptionSizeBoxWidget extends StatelessWidget {
  const DescriptionSizeBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.w323,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: LocaleKeys.embraceFuture.tr(),
              style: Styling.textStyle20,
            ),
            TextSpan(
              text: LocaleKeys.revolutionizePlanning.tr(),
              style: Styling.textStyle20.copyWith(
                color: AppColor.kPrimaryPink,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
