import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/feature/profile/presentation/view/widget/custom_form_profile_set_info.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

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
              CustomTitle(
                title: LocaleKeys.shareYourWorld.tr(),
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
              const CustomFormProfileSetInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

