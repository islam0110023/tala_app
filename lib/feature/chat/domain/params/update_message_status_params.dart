import 'package:chatview/chatview.dart';

class UpdateMessageStatusParams {
  UpdateMessageStatusParams({
    required this.chatId,
    required this.messageId,
    required this.newStatus,
  });

  final String chatId;
  final String messageId;
  final MessageStatus newStatus;
}
