import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/widget/custom_sign_with_icon.dart';
import 'package:tala_app/feature/auth/presentation/manager/register_cubit/register_cubit.dart';

class CustomAlternativeSignUp extends StatelessWidget {
  const CustomAlternativeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSignWithIcon(img: AppImage.kAppleIcon, onTap: () {}),
            SizedBox(width: AppDimensions.w20),
            state is SignUpWithGoogleLoading
                ? const CircularProgressIndicator(color: AppColor.kPrimaryPink)
                : CustomSignWithIcon(
                    img: AppImage.kGoogleIcon,
                    onTap: () {
                      context.read<RegisterCubit>().registerWithGoogle();
                    },
                  ),
          ],
        );
      },
    );
  }
}
