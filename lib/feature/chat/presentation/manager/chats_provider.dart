import 'package:flutter/material.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';

class ChatDataProvider extends InheritedWidget {
  const ChatDataProvider({super.key, required this.chat, required Widget child})
    : super(child: child);
  final ChatEntity chat;

  static ChatDataProvider of(BuildContext context) {
    final ChatDataProvider? result = context
        .dependOnInheritedWidgetOfExactType<ChatDataProvider>();
    assert(result != null, 'No ChatDataProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ChatDataProvider oldWidget) {
    return chat != oldWidget.chat;
  }
}
