import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:tala_app/feature/profile_home/presentation/view/widget/custom_container_profile_image.dart';

class CustomPersonProfile extends StatelessWidget {
  const CustomPersonProfile({super.key, this.img = '', required this.name});
  final String img;
  final String name;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<HomeCubit>().user;
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
           // const CustomContainerProfileImage(),
            CustomChatImageContainer(
              img: const AssetImage(AppImage.kLogoImage),
              radius: AppDimensions.r145,
              image: user?.image,
            ),
            Positioned(
              bottom: AppDimensions.h15,
              right: AppDimensions.w5,
              child: Container(
                width: AppDimensions.r20,
                height: AppDimensions.r20,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(
                      width: AppDimensions.r2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: AppColor.kProfileBorder,
                    ),
                  ),
                ),
                child: Icon(
                  CupertinoIcons.pen,
                  size: AppDimensions.r13,
                  color: AppColor.kColorOnboarding,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppDimensions.h10),
        Text(name, style: Styling.textStyle18700Purple),
      ],
    );
  }
}
