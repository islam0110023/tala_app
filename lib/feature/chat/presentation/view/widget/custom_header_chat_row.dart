import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_rounded_chat_icon_button.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomHeaderChatRow extends StatelessWidget {
  const CustomHeaderChatRow({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = GoRouter.of(context).state.extra as ChatEntity;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.r11),
      child: Row(
        children: [
          CustomArrowBack(
            onTap: () {
              (context).pop();
            },
          ),
          SizedBox(width: AppDimensions.w17),
          CustomChatImageContainer(
            radius: AppDimensions.r55,
            withBorder: true,
            image: chat.photoUrl,
          ),
          SizedBox(width: AppDimensions.w14),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chat.name, style: Styling.nameChatStyle),
                    SizedBox(height: AppDimensions.h11),
                    Text(
                      '${LocaleKeys.typing.tr()}...',
                      style: Styling.chatStateStyle,
                    ),
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
      ),
    );
  }
}
