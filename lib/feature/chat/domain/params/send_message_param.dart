import 'package:chatview/chatview.dart';

class SendMessageParam {
  SendMessageParam({
    required this.uid,
    required this.chatId,
    required this.message,
  });

  final String chatId;
  final String uid;
  Message message;
}
