class ChatStatusEntity {
  ChatStatusEntity({required this.isOnline, required this.lastSeen});
  final bool isOnline;
  final DateTime? lastSeen;
}
