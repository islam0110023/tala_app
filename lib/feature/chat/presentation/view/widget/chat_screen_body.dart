import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_field_row.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_header_chat_row.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding:  EdgeInsetsGeometry.symmetric(horizontal: AppDimensions.r24),
          child: Column(
            children: [
              const CustomHeaderChatRow(),
              SizedBox(height: AppDimensions.h30),
              Expanded(child: ListView()),

              const CustomChatFieldRow(),
              SizedBox(height: AppDimensions.h12),
            ],
          ),
        ),
      ),
    );
  }
}
