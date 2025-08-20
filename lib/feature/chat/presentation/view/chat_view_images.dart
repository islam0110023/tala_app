import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tala_app/core/utils/app_color.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/styling.dart';
import 'package:tala_app/core/widget/custom_arrow_back.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/chat_view_images_body.dart';

class ChatViewImages extends StatelessWidget {
  const ChatViewImages({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouter.of(context).state.extra as Map<String, dynamic>;
    final detailsChat = extra['detailsChat'] as ChatEntity;
    final message = extra['message'] as Message;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: AppDimensions.r25),
          child: CustomArrowBack(
            onTap: () {
              context.pop();
            },
          ),
        ),
        backgroundColor: AppColor.kWhite1.withAlpha(80),
        title: Text(
          message.sentBy == detailsChat.uid ? detailsChat.name : 'You',
          style: Styling.chatNumberStyle,
        ),
        elevation: 0,
      ),
      body: const ChatViewImagesBody(),
      extendBodyBehindAppBar: true,
    );
  }
}
