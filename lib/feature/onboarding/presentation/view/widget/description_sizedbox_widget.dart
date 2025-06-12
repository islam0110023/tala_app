import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';

class DescriptionSizeBoxWidget extends StatelessWidget {
  const DescriptionSizeBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.w323,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Embrace the future of fun and romance,\n',
              style: Styling.textStyle20,
            ),
            TextSpan(
              text: 'Revolutionize your event planning!',
              style: Styling.textStyle20.copyWith(
                color: AppColor.kPrimaryPink,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
