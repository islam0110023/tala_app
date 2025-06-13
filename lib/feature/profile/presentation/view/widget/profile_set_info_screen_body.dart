import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_button.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_fields_set_profile.dart';

class ProfileSetInfoScreenBody extends StatelessWidget {
  const ProfileSetInfoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.h47),
              CustomArrowBack(
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              SizedBox(height: AppDimensions.h18),
              const CustomTitle(
                title: 'Share Piece of Your World',
                textFont: 28,
              ),
              SizedBox(height: AppDimensions.h36),
              Container(
                decoration: const BoxDecoration(
                  color: AppColor.kPrimaryPink,
                  shape: BoxShape.circle,
                ),
                height: AppDimensions.h176,
                width: AppDimensions.w180,
                padding: EdgeInsets.only(top: AppDimensions.h38),
                child: ClipOval(
                  child: SvgPicture.asset(
                    AppImage.kPersonPicture,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.h23),
              const CustomFieldsSetProfile(),
              SizedBox(height: AppDimensions.h42),
              CustomButton(onTap: () {}, name: 'Complete Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
