import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/custom_container_profile_image.dart';

class CustomPersonProfile extends StatelessWidget {
  const CustomPersonProfile({
    super.key, this.img='', required this.name,
  });
  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CustomContainerProfileImage(),
            Positioned(
              bottom: AppDimensions.h15,
              right: AppDimensions.w5,
              child: Container(
                width: AppDimensions.r20,
                height: AppDimensions.r20,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: AppColor.kProfileBorder,
                    ),
                  ),
                ),
                child: Icon(
                  CupertinoIcons.pen,
                  size: 13.sp,
                  color: AppColor.kColorOnboarding,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppDimensions.h10),
        Text(
            name,
            style: Styling.textStyle18700Purple
        ),
      ],
    );
  }
}