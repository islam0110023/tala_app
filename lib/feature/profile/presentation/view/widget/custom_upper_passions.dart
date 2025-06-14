import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/profile_progress_bar.dart';

class CustomUpperPassions extends StatelessWidget {
  const CustomUpperPassions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h47),
        const ProfileProgressBar(done: 2),
        SizedBox(height: AppDimensions.h52),
      ],
    );
  }
}
