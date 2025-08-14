import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';

abstract class ChatsRemoteDataSource {
  Stream<List<ChatEntity>> getChats(String uid);
}

class ChatsRemoteDataSourceImpl extends ChatsRemoteDataSource {
  @override
  Stream<List<ChatEntity>> getChats(String uid) {
    return FirebaseFirestore.instance
        .collection('chats')
        .where('members', arrayContains: uid)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return ChatEntity(
              chatId: doc.id,
              name: data['names'][uid == data['members'][0] ? 1 : 0] ?? '',
              photoUrl: data['photos'][uid == data['members'][0] ? 1 : 0] ?? '',
              lastMessage: data['lastMessage'] ?? '',
              updatedAt:
                  (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
              unreadCount: (data['unreadCounts']?[uid] ?? 0) as int,
            );
          }).toList();
        });
  }
}
