import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';

class ProfileProgressBar extends StatelessWidget {
  const ProfileProgressBar({super.key, required this.done});
  final int done;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomArrowBack(
          onTap: () {
            Navigator.pop(context);
          },
          arrowColor: AppColor.kWhite,
        ),
        const Spacer(),
        SizedBox(
          width: AppDimensions.w168,
          child: LinearProgressIndicator(
            value: done / 4,
            minHeight: AppDimensions.h5,
            backgroundColor: AppColor.kWhite1,
            color: AppColor.kPrimaryPink,
            borderRadius: BorderRadius.circular(AppDimensions.r2),
          ),
        ),
        SizedBox(width: AppDimensions.w10),
        Text('$done/4', style: Styling.textStyle10),
        const Spacer()
      ],
    );
  }
}
