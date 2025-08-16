import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/entities/check_entity.dart';
import 'package:tala_app/feature/chat/domain/params/send_message_param.dart';
import 'package:tala_app/feature/chat/domain/params/update_message_status_params.dart';

abstract class ChatsRemoteDataSource {
  Stream<List<ChatEntity>> getChats(String uid);
  Future<CheckEntity> checkConnection(String uid);
  Future<Unit> notConnection(String chatId);
  Future<Unit> acceptConnection(String chatId);
  Future<Unit> sendMessage(SendMessageParam param);
  Stream<List<Message>> getMessages(String chatId);
  Future<Unit> updateMessageStatus(UpdateMessageStatusParams param);
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
              status: data['status'] ?? '',
              uid: data['fromUserId'] == uid
                  ? data['toUserId']
                  : data['fromUserId'],
              chatId: doc.id,
              name: data['names'][uid == data['fromUserId'] ? 1 : 0] ?? '',
              currentUName:
                  data['names'][uid == data['fromUserId'] ? 0 : 1] ?? '',
              photoUrl: data['photos'][uid == data['fromUserId'] ? 1 : 0] ?? '',
              lastMessage: data['lastMessage'] ?? '',
              updatedAt:
                  (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
              unreadCount: (data['unreadCounts']?[uid] ?? 0) as int,
            );
          }).toList();
        });
  }

  @override
  Future<CheckEntity> checkConnection(String uid) async {
    final currentUid = FirebaseAuth.instance.currentUser!.uid;
    final mexUid = AppConstant.createMexIds(currentUid, uid);
    final chat = await FirebaseFirestore.instance
        .collection('chats')
        .doc(mexUid)
        .get();
    final data = chat.data();
    return CheckEntity(
      isConnection: data!['isConnection'],
      fromUserId: data['fromUserId'],
    );
  }

  @override
  Future<Unit> notConnection(String chatId) async {
    await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
      'members': FieldValue.arrayRemove([
        FirebaseAuth.instance.currentUser!.uid,
      ]),
      'status': 'Rejected',
      'updatedAt': FieldValue.serverTimestamp(),
      'lastMessage': 'Rejected Connection',
    });
    return unit;
  }

  @override
  Future<Unit> acceptConnection(String chatId) async {
    await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
      'status': 'Accepted',
      'updatedAt': FieldValue.serverTimestamp(),
      'lastMessage': 'Accepted Connection',
      'isConnection': true,
    });
    return unit;
  }

  @override
  Future<Unit> sendMessage(SendMessageParam param) async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(param.chatId)
        .collection('messages')
        .doc(param.message.id)
        .set(param.message.toJson());

    return unit;
  }

  @override
  Stream<List<Message>> getMessages(String chatId) {
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Message.fromJson(doc.data())).toList(),
        );
  }

  @override
  Future<Unit> updateMessageStatus(UpdateMessageStatusParams param) async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(param.chatId)
        .collection('messages')
        .doc(param.messageId)
        .update({'status': param.newStatus.name});
    return unit;
  }
}
