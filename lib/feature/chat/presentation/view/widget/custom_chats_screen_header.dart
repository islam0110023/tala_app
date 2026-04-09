import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';
import 'package:tala_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';

class CustomChatsScreenHeader extends StatelessWidget {
  const CustomChatsScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user =context.watch<HomeCubit>().user;
    return Row(
      children: [
        CustomChatImageContainer(
          img: const AssetImage(AppImage.kLogoImage),
          radius: AppDimensions.r45,
         iconSize: 24,
         withBorder: true,
          image: user?.image,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.plus, size: AppDimensions.r24),
        ),
      ],
    );
  }
}
