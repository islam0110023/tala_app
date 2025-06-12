import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionSizeBoxWidget extends StatelessWidget {
  const DescriptionSizeBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323.w,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Embrace the future of fun and romance,\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w800,
              ),
            ),
            TextSpan(
              text: 'Revolutionize your event planning!',
              style: TextStyle(
                color: const Color(0xFFDB0165),
                fontSize: 20.sp,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}