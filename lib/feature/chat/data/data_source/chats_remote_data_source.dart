import 'dart:async';
import 'dart:io';

import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/entities/check_entity.dart';
import 'package:tala_app/feature/chat/domain/params/mark_as_params.dart';
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
  Future<Unit> markMessagesAsRead(MarkAsParams param);
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
    String lastMessage = param.message.message;
    if (param.message.messageType.isVoice) {
      final File file = File(param.message.message);
      final String filePath = 'chats/voices/${param.message.id}.m4a';
      final url = await getUrl(filePath, file);
      param.message = param.message.copyWith(message: url);
      lastMessage = 'Voice Message';
    }
    if (param.message.messageType.isImage) {
      final File file = File(param.message.message);
      final String filePath = 'chats/images/${param.message.id}.jpg';
      final url = await getUrl(filePath, file);
      param.message = param.message.copyWith(message: url);
      lastMessage = 'Image Message';
    }
    if (param.message.replyMessage.messageType.isVoice) {
      final File file = File(param.message.replyMessage.message);
      final String filePath =
          'chats/voices/${param.message.replyMessage.messageId}.m4a';
      final url = await getUrl(filePath, file);
      param.message = param.message.copyWith(
        replyMessage: param.message.replyMessage.copyWith(message: url),
      );
    }
    final Map<String, dynamic> data = param.message.toJson();
    data['createdAt'] = FieldValue.serverTimestamp();
    final chatRef = FirebaseFirestore.instance
        .collection('chats')
        .doc(param.chatId);
    final messageRef = chatRef.collection('messages').doc(param.message.id);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(messageRef, data);
      transaction.update(chatRef, {
        'lastMessage': lastMessage,
        'updatedAt': FieldValue.serverTimestamp(),
        'unreadCounts.${param.message.sentBy}': 0,
        'unreadCounts.${param.uid}': FieldValue.increment(1),
      });
    });
    // await FirebaseFirestore.instance
    //     .collection('chats')
    //     .doc(param.chatId)
    //     .collection('messages')
    //     .doc(param.message.id)
    //     .set(param.message.toJson());

    return unit;
  }

  Future<String> getUrl(String filePath, File file) async {
    final ref = FirebaseStorage.instance.ref().child(filePath);
    await ref.putFile(file);
    final getUrl = await ref.getDownloadURL();
    return getUrl;
  }

  @override
  Stream<List<Message>> getMessages(String chatId) {
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt')
        .snapshots()
        .asyncMap((snapshot) async {
          final futures = snapshot.docs.map((doc) async {
            final Map<String, dynamic> data = doc.data();
            data['createdAt'] = (data['createdAt'] as Timestamp).toDate();
            var message = Message.fromJson(data);
            if (message.messageType.isVoice) {
              final localUrl = await downloadFile(
                message.message,
                message.id,
                message.messageType,
              );
              message = message.copyWith(message: localUrl);
            }
            if (message.replyMessage.messageType.isVoice) {
              final localUrl = await downloadFile(
                message.replyMessage.message,
                message.replyMessage.messageId,
                message.replyMessage.messageType,
              );
              message = message.copyWith(
                replyMessage: message.replyMessage.copyWith(message: localUrl),
              );
            }
            return message;
          });
          return await Future.wait(futures);
        });
  }

  Future<String> downloadFile(
    String url,
    String fileName,
    MessageType type,
  ) async {
    final dir = await getTemporaryDirectory();
    final extension = type.isVoice ? 'm4a' : 'jpg';
    final filePath = '${dir.path}/$fileName.$extension';
    final file = File(filePath);

    if (await file.exists()) {
      return file.path;
    }

    await Dio().download(
      url,
      filePath,
      options: Options(responseType: ResponseType.bytes),
    );

    return file.path;
  }

  Future<String> downloadVoiceFile(String url, String fileName) async {
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/$fileName.m4a';
    final file = File(filePath);

    if (await file.exists()) {
      return file.path;
    }

    await Dio().download(
      url,
      filePath,
      options: Options(responseType: ResponseType.bytes),
    );

    return file.path;
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

  @override
  Future<Unit> markMessagesAsRead(MarkAsParams param) async {
    final query = await FirebaseFirestore.instance
        .collection('chats')
        .doc(param.chatId)
        .collection('messages')
        .where('sentBy', isNotEqualTo: param.uid)
        .get();

    final batch = FirebaseFirestore.instance.batch();

    for (final doc in query.docs) {
      if (doc['status'] != MessageStatus.read.name) {
        batch.update(doc.reference, {'status': MessageStatus.read.name});
      }
    }
    final chatDoc = FirebaseFirestore.instance
        .collection('chats')
        .doc(param.chatId);
    batch.update(chatDoc, {'unreadCounts.${param.uid}': 0});

    await batch.commit();
    return unit;
  }
}
// @override
// Stream<List<Message>> getMessages(String chatId) {
//   return FirebaseFirestore.instance
//       .collection('chats')
//       .doc(chatId)
//       .collection('messages')
//       .orderBy('createdAt')
//       .snapshots()
//       .asyncMap(
//         (snapshot) => snapshot.docs.map((doc) {
//           var message = Message.fromJson(doc.data());
//           if (message.messageType.isVoice) {
//             final localUrl = downloadVoiceFile(message.message, message.id);
//             message = message.copyWith(message: await localUrl);
//           }
//
//           return message;
//         }).toList(),
//       );
// }

// @override
// Stream<List<Message>> getMessages(String chatId) {
//   return FirebaseFirestore.instance
//       .collection('chats')
//       .doc(chatId)
//       .collection('messages')
//       .orderBy('createdAt')
//       .snapshots()
//       .asyncMap((snapshot) async {
//         final messages = await Future.wait(
//           snapshot.docs.map((doc) async {
//             var message = Message.fromJson(doc.data());
//             if (message.messageType.isVoice) {
//               final localUrl = await downloadVoiceFile(
//                 message.message,
//                 message.id,
//               );
//               message = message.copyWith(message: localUrl);
//             }
//             return message;
//           }),
//         );
//
//         return messages;
//       });
// }
// مثال توضيحي لكيفية عمل الكود
// Stream<List<Message>> getMessages(String chatId) {
//   final messageStreamController = StreamController<List<Message>>();
//   FirebaseFirestore.instance
//       .collection('chats')
//       .doc(chatId)
//       .collection('messages')
//       .orderBy('createdAt')
//       .snapshots()
//       .listen((snapshot) async {
//         final messages = <Message>[];
//         for (final doc in snapshot.docs) {
//           var message = Message.fromJson(doc.data());
//           if (message.messageType.isVoice) {
//             final localUrl = await downloadVoiceFile(
//               message.message,
//               message.id,
//             );
//             message = message.copyWith(message: localUrl);
//           }
//           messages.add(message);
//         }
//         messageStreamController.add(messages);
//       });
//   return messageStreamController.stream;
// }
// @override
// Stream<List<Message>> getMessages(String chatId) {
//   final messageController = StreamController<List<Message>>();
//   final messages = <Message>[];
//
//   FirebaseFirestore.instance
//       .collection('chats')
//       .doc(chatId)
//       .collection('messages')
//       .orderBy('createdAt')
//       .snapshots()
//       .listen((snapshot) async {
//         if (messages.isEmpty) {
//           final loadedMessages = await Future.wait(
//             snapshot.docs.map((doc) async {
//               var message = Message.fromJson(doc.data());
//               if (message.messageType.isVoice) {
//                 final localUrl = await downloadFile(
//                   message.message,
//                   message.id,
//                   message.messageType,
//                 );
//                 message = message.copyWith(message: localUrl);
//               }
//               if (message.replyMessage.messageType.isVoice) {
//                 final localUrl = await downloadFile(
//                   message.replyMessage.message,
//                   message.replyMessage.messageId,
//                   message.replyMessage.messageType,
//                 );
//                 message = message.copyWith(
//                   replyMessage: message.replyMessage.copyWith(
//                     message: localUrl,
//                   ),
//                 );
//               }
//               return message;
//             }),
//           );
//           messages.addAll(loadedMessages);
//           messageController.add(messages);
//         } else {
//           final newMessages = snapshot.docChanges
//               .where((change) => change.type == DocumentChangeType.modified)
//               .map((change) async {
//                 var message = Message.fromJson(
//                   change.doc.data() as Map<String, dynamic>,
//                 );
//                 if (message.messageType.isVoice ||
//                     message.messageType.isImage) {
//                   final localUrl = await downloadFile(
//                     message.message,
//                     message.id,
//                     message.messageType,
//                   );
//                   message = message.copyWith(message: localUrl);
//                 }
//                 return message;
//               });
//
//           final newLoadedMessages = await Future.wait(newMessages);
//           messages.addAll(newLoadedMessages);
//           messageController.add(messages);
//         }
//       });
//
//   return messageController.stream;
// }
