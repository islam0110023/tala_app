import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_oval_dash_over_flow.dart';

class CustomOvalDashesTalaOnBoarding extends StatelessWidget {
  const CustomOvalDashesTalaOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        CustomOvalDashOverFlow(x: AppDimensions.w125, y: -AppDimensions.h740),
        CustomOvalDashOverFlow(x: -AppDimensions.w125, y: -AppDimensions.h590),
        CustomOvalDashOverFlow(x: AppDimensions.w100, y: -AppDimensions.h470),
      ],
    );
  }
}
