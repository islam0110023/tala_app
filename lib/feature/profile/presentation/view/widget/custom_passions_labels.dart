import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomPassionsLabels extends StatelessWidget {
  const CustomPassionsLabels({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.what_are_your_passions.tr(),
          style: Styling.textStyle18,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimensions.h12),
        Text(
          LocaleKeys.select_up_to_five.tr(),
          style: Styling.textStyle16700.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppDimensions.h32),
      ],
    );
  }
}