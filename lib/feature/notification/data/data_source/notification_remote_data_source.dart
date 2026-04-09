import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/notification/data/model/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Stream<List<AppNotification>> getNotifications();
  Future<Unit> removeNotification(String? notificationId);
}

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  @override
  Stream<List<AppNotification>> getNotifications() {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('notifications')
        .orderBy('createdAtMs', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return AppNotification<ChatEntity>.fromDoc(
              uid,
              data,
              fromJsonT: (json) => ChatEntity.fromJson(json),
            );
          }).toList();
        });
  }

  @override
  Future<Unit> removeNotification(String? notificationId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('notifications');

    if (notificationId != null) {
      await ref.doc(notificationId).delete();
      return unit;
    }

    final snap = await ref.get();
    final batch = FirebaseFirestore.instance.batch();

    for (final doc in snap.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
    return unit;
  }
}
