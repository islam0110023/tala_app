class UpdateTypingStateParam {
  UpdateTypingStateParam({
    required this.uid,
    required this.chatId,
    required this.isTyping,
  });

  final String chatId;
  final String uid;
  bool isTyping;
}
