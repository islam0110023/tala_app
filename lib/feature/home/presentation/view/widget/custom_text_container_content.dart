import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_text_span.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomTextContainerContent extends StatelessWidget {
  const CustomTextContainerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.r8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Weekend - After Hours Till Down Tour  ',
            style: Styling.homeContainerLabelStyle,
          ),
          SizedBox(height: AppDimensions.h5),
          CustomTextSpan(
            textKey: '${LocaleKeys.location.tr()}: ',
            textValue: 'Olympiastadion, Munich',
          ),
          SizedBox(height: AppDimensions.h5),
          CustomTextSpan(
            textKey: '${LocaleKeys.date.tr()}: ',
            textValue: '04.07.2023 Time: 21:30',
          ),
        ],
      ),
    );
  }
}
