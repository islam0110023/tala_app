import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';

class CustomUpperOtp extends StatelessWidget {
  const CustomUpperOtp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h47),
        CustomArrowBack(
          onTap: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }
}