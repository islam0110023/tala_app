import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlreadySignIn extends StatelessWidget {
  const CustomAlreadySignIn({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'Sign in',
            style: TextStyle(
              color: const Color(0xFFDB0165),
              fontSize: 16.sp,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFFDB0165),

            ),
          ),
        ),
      ],
    );
  }
}
