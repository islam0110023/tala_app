import 'package:flutter/cupertino.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomContainerProfileImage extends StatelessWidget {
  const CustomContainerProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.r145,
      height: AppDimensions.r145,
      decoration: const ShapeDecoration(
        color: AppColor.kWhite1,
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: AppColor.kBoxShadowColor,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        CupertinoIcons.person,
        size: AppDimensions.r85,
        color: AppColor.kPrimaryPink,
      ),
    );
  }
}
