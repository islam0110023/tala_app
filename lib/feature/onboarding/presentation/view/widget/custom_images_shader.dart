import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/onboarding/presentation/view/widget/custom_image_text_onboarding.dart';

class CustomImagesShader extends StatelessWidget {
  const CustomImagesShader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,

      children: [
        Align(
          alignment: Alignment(
            0,
            MediaQuery.of(context).size.width < 600 ? 0.4 : 0.3,
          ),
          child: TextImageShader(
            width: AppDimensions.w150,
            name: 'TALA',
            textStyle: Styling.textStyle50,
          ),
        ),

        Align(
          alignment: const Alignment(0, .58),
          child: Image.asset('assets/images/Frame 5415.png', width: AppDimensions.w238),
        ),
        Align(
          alignment: MediaQuery.of(context).size.width < 600
              ? const Alignment(-.19, .67)
              : const Alignment(-.14, .67),
          child: Image.asset('assets/images/Frame 5416.png', width:AppDimensions.w190 ),
        ),
      ],
    );
  }
}
