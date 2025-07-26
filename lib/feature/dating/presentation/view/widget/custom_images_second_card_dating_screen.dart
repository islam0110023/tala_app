import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_image_dating_screen.dart';

class CustomImagesSecondCardDatingScreen extends StatelessWidget {
  const CustomImagesSecondCardDatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.h61,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: AppDimensions.w16);
        },
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.r18),
            child: SizedBox(
              width: AppDimensions.r60,
              height: AppDimensions.r60,
              child: const CustomImageDatingScreen(
                image:
                    'https://t3.ftcdn.net/jpg/02/43/12/34/240_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              ),
            ),
          );
        },
      ),
    );
  }
}
