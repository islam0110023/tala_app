import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.password_flag = false,
  });
  final String hint;
  final bool password_flag;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 58,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFE9F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadows: const [
          BoxShadow(
            color: Color(0x285B0E6D),
            blurRadius: 14,
            offset: Offset(5, 5),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        obscureText: password_flag,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black.withAlpha(128),
            fontSize: 13,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: InputBorder.none,
        ),
      ),
    );
  }
}