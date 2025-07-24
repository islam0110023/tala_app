import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/notification/presentation/view/widget/custom_notificatio_rounded_container.dart';

class CustomNotificationContainer extends StatelessWidget {
  const CustomNotificationContainer({
    super.key,
    required this.title,
    required this.message,
    required this.time,
  });
  final String title;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.r17,
        vertical: AppDimensions.r16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(AppDimensions.r15),
        boxShadow: const [
          BoxShadow(
            color: AppColor.kBoxShadowColor,
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomNotificationRoundedContainer(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.r10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Styling.textStyle13600Pink),
                  SizedBox(height: AppDimensions.h4),
                  Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styling.textStyle11400Black,
                  ),
                ],
              ),
            ),
          ),
          Text(time, style: Styling.textStyle10700LightGray),
        ],
      ),
    );
  }
}
