import 'package:chatview/chatview.dart';

class SendMessageParam {
  SendMessageParam({required this.chatId, required this.message});

  final String chatId;
  final Message message;
}
