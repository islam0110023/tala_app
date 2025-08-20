class UpdateTypingStateParam {
  UpdateTypingStateParam( {required this.uid, required this.chatId,this.isTyping=false,});

  final String chatId;
  final String uid;
  final bool isTyping;
}