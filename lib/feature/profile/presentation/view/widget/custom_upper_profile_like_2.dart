import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_progress_bar.dart';

class CustomUpperProfileLike2 extends StatelessWidget {
  const CustomUpperProfileLike2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h47),
        const ProfileProgressBar(done: 4, isLight: true),
        SizedBox(height: AppDimensions.h23),
        Text(
          'Write what you like',
          textAlign: TextAlign.center,
          style: Styling.textStyle18.copyWith(color: AppColor.kPrimaryPink),
        ),
        SizedBox(height: AppDimensions.h9),
        Text(
          'Your opinion matters to us to improve your\nexperience using this application',
          textAlign: TextAlign.center,
          style: Styling.textStyleGray16,
        ),
        SizedBox(height: AppDimensions.h32),
      ],
    );
  }
}
