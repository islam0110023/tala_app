import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_rounded_chat_icon_button.dart';

class CustomChatFieldRow extends StatelessWidget {
  const CustomChatFieldRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: AppDimensions.h47,
            decoration: BoxDecoration(
              color: AppColor.kChatFieldColor,
              borderRadius: BorderRadius.circular(AppDimensions.r20),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.kBorderShadowColor,
                  blurRadius: 14,
                  offset: Offset(5, 5),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: Styling.chatFieldStyle,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.attach_file_rounded,color: AppColor.kPrimaryPink), onPressed: () {  },
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt_rounded,color: AppColor.kPrimaryPink), onPressed: () {  },
                    ),
                  ],
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.tag_faces_rounded,color: AppColor.kPrimaryPink), onPressed: () {  },
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
        SizedBox(width: AppDimensions.w10,),
        CustomRoundedChatButton(icon: Icons.mic,isPrimary: false,width: 55,height: 55, onPressed: () {  },),
      ],
    );
  }
}