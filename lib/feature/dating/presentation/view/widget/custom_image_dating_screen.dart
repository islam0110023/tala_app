import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomImageDatingScreen extends StatelessWidget {
  const CustomImageDatingScreen({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Icon(
        Icons.error_outline,
        color: AppColor.kPrimaryPink,
        size: AppDimensions.r24,
      ),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(color: AppColor.kPrimaryPink),
      ),
      imageUrl:image
    );
  }
}
