import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/core/widget/custom_sign_with_icon.dart';
import 'package:tala_app/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomAlternativeSignIn extends StatelessWidget {
  const CustomAlternativeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSignWithIcon(img: AppImage.kAppleIcon, onTap: () {}),
            SizedBox(width: AppDimensions.w20),
            state is LoginWithGoogleLoading
                ? const CircularProgressIndicator(color: AppColor.kPrimaryPink)
                : CustomSignWithIcon(
                    img: AppImage.kGoogleIcon,
                    onTap: () async{
                      final isConnected =await  AppConstant.isConnected();
                      if (!isConnected) {
                        AppConstant.buildShowSnackBar(
                          context,
                          LocaleKeys.noInternetConnection.tr(),
                        );
                        return;
                      }
                      context.read<LoginCubit>().loginWithGoogle();
                    },
                  ),
          ],
        );
      },
    );
  }
}
