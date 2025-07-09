import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_rounded_chat_icon_button.dart';

class CustomHeaderChatRow extends StatelessWidget {
  const CustomHeaderChatRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomArrowBack(
          onTap: () {
            (context).pop();
          },
        ),
        SizedBox(width: AppDimensions.w17),
        CustomChatImageContainer(
          img: const AssetImage(AppImage.kImageIslam),
          radius: AppDimensions.r55,
          withBorder: true,
        ),
        SizedBox(width: AppDimensions.w14),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Islam Ramadan', style: Styling.nameChatStyle),
                  SizedBox(height: AppDimensions.h11),
                  Text('Typing...', style: Styling.chatStateStyle),
                ],
              ),
              CustomRoundedChatButton(
                icon: Icons.call,
                onPressed: () {},
                radius: AppDimensions.r50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
