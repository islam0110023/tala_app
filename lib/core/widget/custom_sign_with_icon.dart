import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSignWithIcon extends StatelessWidget {
  const CustomSignWithIcon({
    super.key, required this.img, required this.onTap,
  });
  final VoidCallback onTap;
  final String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.43,
        height: 40.43,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Color(0xad808080),width: 0.6),

        ),
        child: SvgPicture.asset(img,width: 24.14,height: 24.69,fit: BoxFit.none,),

      ),
    );
  }
}