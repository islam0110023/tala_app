import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_rounded_chat_icon_button.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_text_field_chat.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class CustomChatFieldRow extends StatelessWidget {
  const CustomChatFieldRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
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
            child: CustomTextFieldChat(
              controller: TextEditingController(),
              onPressedFile: () {},
              onPressedCamera: () {},
            ),
          ),
        ),
        SizedBox(width: AppDimensions.w10),
        CustomRoundedChatButton(
          icon: Icons.mic,
          isPrimary: false,
          radius: AppDimensions.r55,
          onPressed: () {},
        ),
      ],
    );
  }
}
