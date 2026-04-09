import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tala_app/core/services/notification_service/local_notification_service.dart';
import 'package:tala_app/core/utils/routes.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';

class PushNotificationsServices {
  PushNotificationsServices._();

  static final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static ChatEntity? pendingChatId;

  static Future init() async {
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: true,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    // FirebaseMessaging.onBackgroundMessage(handlerOnBackgroundMessage);
    //foreground
    foregroundNotifications();
    listenNotificationClick();
    await handleInitialMessage();
    messaging.onTokenRefresh.listen((token) async {
      log(token);
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
              'fcmTokens': FieldValue.arrayUnion([token]),
            });
      }
    });
  }

  static void foregroundNotifications() {
    FirebaseMessaging.onMessage.listen((message) {
      final chat = chatFromNotification(message);

      if (pendingChatId != null &&
          chat != null &&
          pendingChatId!.chatId == chat.chatId) {
        return;
      }

      LocalNotificationServices.showForegroundNotifications(message);
    });
  }

  static Future<void> handleInitialMessage() async {
    final message = await messaging.getInitialMessage();
    if (message != null && message.data['type'] == 'chat') {
      pendingChatId = chatFromNotification(message);
    }
  }

  static Future<void> handlerOnBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  static void listenNotificationClick() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] == 'chat') {
        final chat = chatFromNotification(message);
        if (chat != null) {
          openChat(chat);
        }
      } else if (message.data['type'] == 'connection_request' ||
          message.data['type'] == 'connection_accepted' ||
          message.data['type'] == 'connection_rejected') {
        AppRoutes.route.go(AppRoutes.homeScreen);
      }
    });
  }

  static void openChat(ChatEntity chat) {
    AppRoutes.route.push(AppRoutes.chatScreen, extra: chat);
  }

  static ChatEntity? chatFromNotification(RemoteMessage message) {
    final data = message.data;

    return ChatEntity(
      chatId: data['chatId'],
      uid: data['uid'],
      name: data['name'] ?? '',
      currentUName: data['currentUName'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      lastMessage: data['lastMessage'] ?? '',
      status: data['status'] ?? '',
      unreadCount: int.parse(data['unreadCount'] ?? '0'),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        int.parse(data['updatedAt']),
      ),
    );
  }

  static Future<String?> getToken() async {
    try {
      if (Platform.isIOS) {
        await messaging.getAPNSToken();
      }
      final token = await messaging.getToken();
      log('token: $token');
      return token;
    } catch (e) {
      return null;
    }
  }
}
