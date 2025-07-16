import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/custom_text_clickable.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r13),
      child: Column(
        children: [
          CustomTextClickable(
            title: LocaleKeys.your_profile.tr(),
            onTap: () {},
            icon: const Icon(Icons.person, color: Colors.white),
          ),

          CustomTextClickable(
            title: LocaleKeys.ticket.tr(),
            onTap: () {},
            icon: const Icon(CupertinoIcons.ticket, color: Colors.white),
          ),

          CustomTextClickable(
            title: LocaleKeys.payment_methods.tr(),
            onTap: () {},
            icon: const Icon(Icons.payment, color: Colors.white),
          ),

          CustomTextClickable(
            title: LocaleKeys.setting.tr(),
            onTap: () {},
            icon: const Icon(Icons.settings, color: Colors.white),
          ),

          CustomTextClickable(
            title: LocaleKeys.privacy_policy.tr(),
            onTap: () {},
            icon: const Icon(CupertinoIcons.lock, color: Colors.white),
          ),

          CustomTextClickable(
            title: LocaleKeys.favorite.tr(),
            onTap: () {},
            icon: const Icon(Icons.favorite, color: Colors.white),
          ),

          CustomTextClickable(
            title: LocaleKeys.log_out.tr(),
            onTap: () {
              AppConstant.showSignOutConfirmationDialog(context);
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
