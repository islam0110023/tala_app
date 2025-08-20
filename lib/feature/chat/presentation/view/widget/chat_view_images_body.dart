import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

class ChatViewImagesBody extends StatelessWidget {
  const ChatViewImagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouter.of(context).state.extra as Map<String, dynamic>;
    final message = extra['message'] as Message;

    return PhotoView(imageProvider: NetworkImage(message.message),);
  }
}
