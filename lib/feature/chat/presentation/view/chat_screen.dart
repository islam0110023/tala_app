import 'package:flutter/material.dart';
import 'package:tala_app/feature/chat/presentation/view/widget/chat_screen_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ChatScreenBody());
  }
}
