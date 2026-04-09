class ChatEntity {
  factory ChatEntity.fromJson(Map<String, dynamic> data) {
    return ChatEntity(
      chatId: data['chatId'] ?? '',
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      currentUName: data['currentUName'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      lastMessage: data['lastMessage'] ?? '',
      status: data['status'] ?? '',
      unreadCount: int.tryParse('${data['unreadCount'] ?? 0}') ?? 0,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        int.tryParse('${data['updatedAt'] ?? 0}') ?? 0,
      ),
    );
  }
  const ChatEntity({
    required this.chatId,
    required this.name,
    required this.photoUrl,
    required this.lastMessage,
    required this.updatedAt,
    required this.unreadCount,
    required this.uid,
    required this.status,
    required this.currentUName,
  });
  final String chatId;
  final String uid;
  final String status;
  final String name;
  final String currentUName;
  final String photoUrl;
  final String lastMessage;
  final DateTime updatedAt;
  final int unreadCount;
}
