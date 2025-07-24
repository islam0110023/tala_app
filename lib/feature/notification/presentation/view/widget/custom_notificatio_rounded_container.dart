import 'package:flutter/cupertino.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomNotificationRoundedContainer extends StatelessWidget {
  const CustomNotificationRoundedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.r45,
      height: AppDimensions.r45,
      decoration: const BoxDecoration(
        color: AppColor.kPrimaryPink,
        shape: BoxShape.circle,
      ),
      child: Icon(CupertinoIcons.heart_fill,color: AppColor.kWhite,),
    );
  }
}