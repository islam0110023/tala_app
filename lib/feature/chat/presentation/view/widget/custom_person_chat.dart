import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/date_time_extention.dart';
import 'package:tala_app/feature/chat/presentation/manager/chats_provider.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';

class CustomPersonChat extends StatelessWidget {
  const CustomPersonChat({super.key});

  @override
  Widget build(BuildContext context) {
    final details = ChatDataProvider.of(context) as ChatDataProvider?;
    return ListTile(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.chatScreen);
      },
      contentPadding: EdgeInsets.zero,

      leading: CustomChatImageContainer(
        image: details?.chat.photoUrl ?? '',
        radius: AppDimensions.r55,
        withBorder: true,
      ),
      title: Text(details!.chat.name, style: Styling.nameChatStyle),
      subtitle: Text(details.chat.lastMessage, style: Styling.chatsHintStyle),
      trailing: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              details.chat.updatedAt.toChatTime(),
              style: Styling.timeChatStyle,
            ),
            SizedBox(height: AppDimensions.h6),
            details.chat.unreadCount != 0
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.r5,
                      vertical: AppDimensions.r2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.kPrimaryPink,
                      borderRadius: BorderRadius.circular(AppDimensions.r5),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColor.kNumberMessageColor,
                          blurRadius: 4,
                          offset: Offset(4, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Text(
                      details.chat.unreadCount > 99
                          ? '+99'
                          : details.chat.unreadCount.toString(),
                      style: Styling.messageNumberStyle,
                    ),
                  )
                : SizedBox(height: AppDimensions.h10, width: AppDimensions.r25),
          ],
        ),
      ),
    );
  }
}
