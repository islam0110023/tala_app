import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';

class CustomChatImageContainer extends StatelessWidget {
  const CustomChatImageContainer({
    super.key,
    this.img,
    required this.radius,
    this.withBorder = false,
    this.image,
    this.iconSize,
  });
  final AssetImage? img;
  final double radius;

  final bool withBorder;
  final String? image;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,

        border: (withBorder)
            ? Border.all(color: AppColor.kGray, width: AppDimensions.r2)
            : null,
        // image: (image == null)
        //     ? DecorationImage(image: img!, fit: BoxFit.cover,)
        //     : null,
      ),
      child: (image != null)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: CachedNetworkImage(
                imageUrl: image!.isEmpty
                    ? 'https://media.istockphoto.com/id/2151669184/vector/vector-flat-illustration-in-grayscale-avatar-user-profile-person-icon-gender-neutral.jpg?s=612x612&w=0&k=20&c=UEa7oHoOL30ynvmJzSCIPrwwopJdfqzBs0q69ezQoM8='
                    : image!,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.kPrimaryPink,
                  ),
                ),
              ),
            )
          : Icon(Icons.person_2_outlined, size: iconSize ?? 100),
    );
  }
}
