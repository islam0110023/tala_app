import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/event_show_manager.dart';
import 'package:tala_app/feature/home/presentation/view/widget/custom_text_span.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomTextContainerContent extends StatelessWidget {
  const CustomTextContainerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final event = EventShowManager.of(context).event;
    return Padding(
      padding: EdgeInsets.all(AppDimensions.r8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.name,
            style: Styling.homeContainerLabelStyle,
          ),
          SizedBox(height: AppDimensions.h5),
          CustomTextSpan(
            textKey: '${LocaleKeys.location.tr()}: ',
            textValue: event.location,
          ),
          SizedBox(height: AppDimensions.h5),
          CustomTextSpan(
            textKey: '${LocaleKeys.date.tr()}: ',
            textValue: event.dateTime,
          ),
        ],
      ),
    );
  }
}
