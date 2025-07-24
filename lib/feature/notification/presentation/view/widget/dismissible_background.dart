import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({super.key, required this.isStart});
  final bool isStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.dismissibleBackground,
        borderRadius: BorderRadius.circular(AppDimensions.r15),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r20),
      alignment: isStart ? Alignment.centerLeft : Alignment.centerRight,
      child: Row(
        mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (!isStart)
            Text('Remove Notification',
                style: Styling.textStyle16700),
          if (!isStart) SizedBox(width: AppDimensions.w10),
          Icon(Icons.delete_outline, color: Colors.white, size: AppDimensions.r25),
          if (isStart) SizedBox(width: AppDimensions.w10),
          if (isStart)
            Text('Remove Notification',
                style: Styling.textStyle16700),
        ],
      ),
    );
  }
}
