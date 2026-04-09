import 'package:cloud_firestore/cloud_firestore.dart';

class AppNotification<T> {
  factory AppNotification.fromDoc(
    String id,
    Map<String, dynamic> json, {
    T Function(dynamic json)? fromJsonT,
  }) {
    return AppNotification(
      id: id,
      type: json['type'] ?? '',
      chatId: json['chatId'] ?? '',
      senderId: json['senderId'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      data: fromJsonT != null && json['data'] != null
          ? fromJsonT(json['data'])
          : null,
      createdAt: (json['createdAt'] != null)
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.fromMillisecondsSinceEpoch((json['createdAtMs'] ?? 0)),
      createdAtMs: json['createdAtMs'] ?? 0,
      isRead: json['isRead'] ?? false,
      notificationId: json['id'] ?? '',
    );
  }

  AppNotification({
    required this.id,
    required this.type,
    required this.chatId,
    required this.senderId,
    required this.title,
    required this.body,
    required this.data,
    required this.createdAt,
    required this.createdAtMs,
    required this.isRead,
    required this.notificationId,
  });
  final String id;
  final String type;
  final String chatId;
  final String senderId;
  final String title;
  final String body;
  final T? data;
  final DateTime createdAt;
  final int createdAtMs;
  final bool isRead;
  final String notificationId;
}
