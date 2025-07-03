import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_image_container.dart';

class CustomPersonChat extends
StatelessWidget {
  const CustomPersonChat({
    super.key, required this.img, required this.name, required this.message, required this.time, required this.number,
  });
  final AssetImage img;
  final String name;
  final String message;
  final String time;
  final int number;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomChatImageContainer(
          img: img,
          width: 55,
          height: 55,
          withBorder: true,
        ),
        SizedBox(width: AppDimensions.w12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.chatScreen);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: Styling.nameChatStyle,
                          ),
                          SizedBox(height: AppDimensions.h7),
                          Text(
                            message,
                            style: Styling.chatsHintStyle,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                            time,
                            style: Styling.timeChatStyle
                        ),
                        SizedBox(height: AppDimensions.h6),
                        Container(
                          width: AppDimensions.h23,
                          height: AppDimensions.h14,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.kPrimaryPink,
                            borderRadius: BorderRadius.circular(AppDimensions.r5),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.kNumberMessageColor,
                                blurRadius: 4,
                                offset: Offset(4, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Text(
                            number.toString(),
                            style: Styling.messageNumberStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.h12),
              Divider(
                height: AppDimensions.h1,
                thickness: AppDimensions.sp1,
                color: AppColor.kDividerColor,
              ),
            ],
          ),
        ),

      ],
    );
  }
}