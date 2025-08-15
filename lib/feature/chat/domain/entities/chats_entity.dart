class ChatEntity {
  const ChatEntity( {
    required this.chatId,
    required this.name,
    required this.photoUrl,
    required this.lastMessage,
    required this.updatedAt,
    required this.unreadCount,
    required this.uid,
    required this.status,
  });
  final String chatId;
  final String uid;
  final String status;
  final String name;
  final String photoUrl;
  final String lastMessage;
  final DateTime updatedAt;
  final int unreadCount;
}
