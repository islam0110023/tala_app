import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/presentation/manager/match_user_provider.dart';
import 'package:tala_app/feature/dating/presentation/view/widget/custom_images_second_card_dating_screen.dart';

class CustomSecondCardDating extends StatelessWidget {
  const CustomSecondCardDating({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchUserEntity? matchUser = MatchUserProvider.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: AppDimensions.h515,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.r25,
          vertical: AppDimensions.r20,
        ),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.kBackgroundSoftGray,
              AppColor.kGradientBlushPink,
              AppColor.kAccentBerryRose,
            ],
            stops: [0.2, .5, .7],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimensions.r75),
              topRight: Radius.circular(AppDimensions.r75),
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: REdgeInsets.only(bottom: 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // const CustomImagesSecondCardDatingScreen(),
              SizedBox(height: AppDimensions.h9),
              Text('Bio:', style: Styling.textStyleDating20),
              SizedBox(height: AppDimensions.h5),
              Text(
                matchUser?.bio ?? '',
                style: Styling.textStyle16.copyWith(color: AppColor.kWhite1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
