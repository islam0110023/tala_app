import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomPersonChatSkeleton extends StatelessWidget {
  const CustomPersonChatSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: AppDimensions.r55,
          height: AppDimensions.r55,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.kGray,
          ),
        ),
        title: Container(
          height: AppDimensions.h14,
          width: double.infinity,
          color: AppColor.kGray,
          margin: EdgeInsets.only(bottom: AppDimensions.h6),
        ),
        subtitle: Container(
          height: AppDimensions.h12,
          width: AppDimensions.w150,
          color: AppColor.kGray,
        ),
        trailing: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppDimensions.h12,
                width: AppDimensions.w40,
                color: AppColor.kGray,
              ),
              SizedBox(height: AppDimensions.h6),
              Container(
                height: AppDimensions.h18,
                width: AppDimensions.h18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
