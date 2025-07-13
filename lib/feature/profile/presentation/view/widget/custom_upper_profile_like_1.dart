import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_progress_bar.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomUpperProfileLike1 extends StatelessWidget {
  const CustomUpperProfileLike1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h47),
        const ProfileProgressBar(done: 3, isLight: true),
        SizedBox(height: AppDimensions.h23),
        Text(
          LocaleKeys.write_what_you_like.tr(),
          textAlign: TextAlign.center,
          style: Styling.textStyle18.copyWith(color: AppColor.kPrimaryPink),
        ),
        SizedBox(height: AppDimensions.h9),
        Text(
          LocaleKeys.opinion_matters.tr(),
          textAlign: TextAlign.center,
          style: Styling.textStyleGray16,
        ),
        SizedBox(height: AppDimensions.h32),
      ],
    );
  }
}
