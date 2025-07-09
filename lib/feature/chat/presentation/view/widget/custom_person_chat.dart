import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';

class CustomPersonChat extends StatelessWidget {
  const CustomPersonChat({
    super.key,
    required this.img,
    required this.name,
    required this.message,
    required this.time,
    required this.number,
  });
  final AssetImage img;
  final String name;
  final String message;
  final String time;
  final int number;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.chatScreen);
      },
      contentPadding: EdgeInsets.zero,
      leading: CustomChatImageContainer(
        img: img,
        radius: AppDimensions.r55,
        withBorder: true,
      ),
      title: Text(name, style: Styling.nameChatStyle),
      subtitle: Text(message, style: Styling.chatsHintStyle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: Styling.timeChatStyle),
          SizedBox(height: AppDimensions.h6),
          number != 0
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
                    number > 99 ? '+99' : number.toString(),
                    style: Styling.messageNumberStyle,
                  ),
                )
              : SizedBox(height: AppDimensions.h10, width: AppDimensions.r25),
        ],
      ),
    );
  }
}
