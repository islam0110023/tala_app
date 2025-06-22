import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/core/widget/custom_title.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomUpperLogin extends StatelessWidget {
  const CustomUpperLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimensions.h47),
        CustomArrowBack(onTap: () {
          GoRouter.of(context).pop();
        }),
        SizedBox(height: AppDimensions.h33),
        CustomTitle(
          title: LocaleKeys.readyToMakeMemories.tr(),
        ),
        SizedBox(height: AppDimensions.h49),
      ],
    );
  }
}
