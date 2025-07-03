import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_chat_field_row.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/custom_header_chat_row.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              const CustomHeaderChatRow(),
              SizedBox(height: AppDimensions.h30),
              Expanded(child: ListView()),
              const Spacer(),
              const CustomChatFieldRow(),
              SizedBox(height: AppDimensions.h12),
            ],
          ),
        ),
      ),
    );
  }
}
