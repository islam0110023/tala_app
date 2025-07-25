import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomAppBarNotification extends StatelessWidget {
  const CustomAppBarNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(LocaleKeys.notification.tr()),
      centerTitle: true,
      titleTextStyle: Styling.textStyle18700Purple,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.kWhite),
      ),
    );
  }
}
