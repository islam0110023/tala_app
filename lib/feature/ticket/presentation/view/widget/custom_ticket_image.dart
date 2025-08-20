import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomTicketImage extends StatelessWidget {
  const CustomTicketImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.w150,
      height: AppDimensions.h110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.r12),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}