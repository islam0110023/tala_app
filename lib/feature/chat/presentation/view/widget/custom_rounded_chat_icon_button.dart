import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';

class CustomRoundedChatButton extends StatelessWidget {
  const CustomRoundedChatButton({
    super.key, required this.icon, this.isPrimary=true, this.width=50, this.height=50, required this.onPressed,
  });
  final IconData icon;
  final bool isPrimary;
  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.sp,
      height: height.sp,
      decoration: ShapeDecoration(
          color: (isPrimary)?AppColor.kWhite:AppColor.kPrimaryPink,
          shape: const OvalBorder(
            side: BorderSide(
              width: 1,
              color: AppColor.kBorderChatColor,
            ),
          ),
          shadows: (isPrimary)?const [
            BoxShadow(
              color: AppColor.kBorderShadowColor,
              blurRadius: 14,
              offset: Offset(5, 5),
              spreadRadius: 0,
            )
          ]:null
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: (isPrimary)?AppColor.kPrimaryPink:AppColor.kWhite,
        ),
      ),
    );
  }
}