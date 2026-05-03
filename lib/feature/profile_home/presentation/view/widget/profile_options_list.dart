import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/db/cache_helper/cache_helper.dart';
import 'package:tala_app/core/services/notification_service/push_notification_service.dart';
import 'package:tala_app/core/services/presence_service.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/custom_text_clickable.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<HomeCubit>().user;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.r13),
      child: Column(
        children: [
          CustomTextClickable(
            title: LocaleKeys.your_profile.tr(),
            onTap: () async {
              final back = await context.push(
                AppRoutes.updateProfileScreen,
                extra: user,
              );
              if (back == 'isUpdate') {
                context.read<HomeCubit>().getUser();
              }
            },
            icon: const Icon(Icons.person, color: Colors.white),
          ),

          // CustomTextClickable(
          //   title: LocaleKeys.ticket.tr(),
          //   onTap: () {},
          //   icon: const Icon(CupertinoIcons.ticket, color: Colors.white),
          // ),

          // CustomTextClickable(
          //   title: LocaleKeys.payment_methods.tr(),
          //   onTap: () {},
          //   icon: const Icon(Icons.payment, color: Colors.white),
          // ),

          // CustomTextClickable(
          //   title: LocaleKeys.setting.tr(),
          //   onTap: () {},
          //   icon: const Icon(Icons.settings, color: Colors.white),
          // ),
          CustomTextClickable(
            title: LocaleKeys.privacy_policy.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRoutes.privacyPolicyScreen);
            },
            icon: const Icon(CupertinoIcons.lock, color: Colors.white),
          ),

          CustomTextClickable(
            title: LocaleKeys.favorite.tr(),
            onTap: () {
              GoRouter.of(context).push(AppRoutes.favoriteEventScreen);
            },
            icon: const Icon(Icons.favorite, color: Colors.white),
          ),
          CustomTextClickable(
            title: LocaleKeys.log_out.tr(),
            onTap: () async {
              final result = await AppConstant.showSignOutConfirmationDialog(
                context,
                LocaleKeys.sign_out.tr(),
                LocaleKeys.are_you_sure_sign_out.tr(),
              );
              if (result == OkCancelResult.ok) {
                final result = await showTextInputDialog(
                  context: context,
                  title: 'Confirm Password',
                  message: 'Enter your password to continue',
                  textFields: [
                    const DialogTextField(
                      hintText: 'Password',
                      obscureText: true,
                    ),
                  ],
                );
                if (result != null && result.isNotEmpty) {
                  final password = result.first;

                  try {
                    final user = FirebaseAuth.instance.currentUser!;

                    final credential = EmailAuthProvider.credential(
                      email: user.email!,
                      password: password,
                    );

                    await user.reauthenticateWithCredential(credential);
                    await PresenceService.instance.stop();
                    await removeFcmTokenOnLogout();
                    await CacheHelper.removeData(
                      key: AppConstant.kUserIsComplete,
                    );
                    await FirebaseAuth.instance.signOut();

                    GoRouter.of(context).go(AppRoutes.loginScreen);
                  } catch (e) {
                    AppConstant.buildShowSnackBar(
                      context,
                      'Wrong password or error occurred',
                    );
                  }
                }
              }
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Future<void> removeFcmTokenOnLogout() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final token = await PushNotificationsServices.getToken();

    if (token == null) return;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'fcmTokens': FieldValue.arrayRemove([token]),
    });
  }
}
