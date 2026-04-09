import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_button.dart';

class SubscriptionDialog extends StatelessWidget {
  const SubscriptionDialog({super.key, required this.message, this.onTap});
  final String message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: REdgeInsets.symmetric(horizontal: 0),
      child: Stack(
        alignment: Alignment.center,

        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.white.withAlpha(20)),
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: REdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColor.kColorBorderOtp, width: 1.r),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.kBoxShadowColor,
                  blurRadius: 12,
                  offset: Offset(0, 0),
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Limited Reached', style: Styling.textStyle20),
                const RSizedBox(height: 4),
                Icon(
                  Icons.warning_amber_rounded,
                  size: 64.r,
                  color: AppColor.kPrimaryPink,
                ),
                const RSizedBox(height: 24),
                Text(
                  'You need to subscribe to use this feature.',
                  style: Styling.textStyleChat14,
                ),
                const RSizedBox(height: 8),
                Text(message, style: Styling.textStyleBlack12),
                const RSizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {},
                        name: 'Subscribe Now',
                        style: Styling.textStyle14700White,
                      ),
                    ),
                    const RSizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
                        onTap:
                            onTap ??
                            () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                        name: 'Cancel',
                        style: Styling.textStyle14700White,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
