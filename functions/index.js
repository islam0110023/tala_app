//const { onDocumentCreated } = require("firebase-functions/v2/firestore");
//const admin = require("firebase-admin");
//
//admin.initializeApp();
//
//exports.onNewChatMessage = onDocumentCreated(
//  "chats/{chatId}/messages/{messageId}",
//  async (event) => {
//    console.log("🔥 onNewChatMessage triggered");
//
//    try {
//      if (!event.data) {
//        console.warn("⚠️ No event data");
//        return;
//      }
//
//      const messageData = event.data.data();
//      const chatId = event.params.chatId;
//
//      if (!messageData) {
//        console.warn("⚠️ messageData is null", { chatId });
//        return;
//      }
//
//      const { sentBy, message, message_type } = messageData;
//
//      console.log("📩 Message received", {
//        chatId,
//        sentBy,
//        message_type,
//      });
//
//      // Get chat document
//      const chatRef = admin.firestore().collection("chats").doc(chatId);
//      const chatSnap = await chatRef.get();
//
//      if (!chatSnap.exists) {
//        console.warn("⚠️ Chat document not found", { chatId });
//        return;
//      }
//
//      const chatData = chatSnap.data();
//      const members = chatData.members || [];
//
//      const receiverId = members.find((id) => id !== sentBy);
//      if (!receiverId) {
//        console.warn("⚠️ Receiver not found", { members, sentBy });
//        return;
//      }
//
//      const senderIndex = members.indexOf(sentBy);
//      const userDoc = await admin.firestore()
//            .collection("users")
//            .doc(receiverId)
//            .get();
//
//          if (!userDoc.exists){
//        console.warn("⚠️ User document not found", { receiverId });
//        return;
//      }
//
//    const fcmToken = userDoc.data().fcmToken;
//      if (!fcmToken) {
//        console.warn("⚠️ FCM token missing", { receiverId });
//        return;
//      }
//
//      let body = "New message";
//      if (message_type === "text") body = message;
//      if (message_type === "voice") body = "🎤 Voice message";
//      if (message_type === "image") body = "📷 Image";
//
//      const payload = {
//        token: fcmToken,
//        notification: {
//          title: chatData.names?.[senderIndex] ?? "New message",
//          body,
//        },
//        data: {
//          chatId: String(chatId),
//          uid: String(sentBy),
//          name: String(chatData.names?.[senderIndex] ?? ""),
//          currentUName: String(
//            chatData.names?.[senderIndex === 0 ? 1 : 0] ?? ""
//          ),
//          photoUrl: String(chatData.photos?.[senderIndex] ?? ""),
//          lastMessage: String(body),
//          status: String(chatData.status ?? ""),
//          unreadCount: String(chatData.unreadCounts?.[receiverId] ?? 0),
//          updatedAt: String(Date.now()),
//        },
//        android: {
//          priority: "high",
//          notification: {
//            sound: "default",
//            channelId: "chat_channel",
//          },
//        },
//        apns: {
//          payload: {
//            aps: {
//              sound: "default",
//              badge: 1,
//            },
//          },
//        },
//      };
//
//      console.log("🚀 Sending FCM", {
//        to: receiverId,
//        token: fcmToken,
//      });
//
//      const response = await admin.messaging().send(payload);
//
//      console.log("✅ FCM sent successfully", { response });
//      // ✅ Save notification to inbox
//      try {
//      const notifRef = admin.firestore()
//        .collection("users")
//        .doc(receiverId)
//        .collection("notifications")
//        .doc();
//        await notifRef.set({
//        id: notifRef.id,
//         type: "chat",
//                    chatId: String(chatId),
//                    senderId: String(sentBy),
//                    title: String(chatData.names?.[senderIndex] ?? "New message"),
//                    body: String(body),
//                    data: payload.data,
//                    createdAt: admin.firestore.FieldValue.serverTimestamp(),
//                    createdAtMs: Date.now(),
//                    isRead: false,
//        });
//        console.log("📥 Notification saved to inbox", { receiverId, chatId });
//      } catch (e) {
//        console.error("❌ Failed to save notification in inbox", {
//          receiverId,
//          chatId,
//          error: e.message,
//        });
//      }
//
//    } catch (error) {
//      console.error("❌ Error in onNewChatMessage", {
//        message: error.message,
//        stack: error.stack,
//      });
//    }
//  }
//);





const { onDocumentCreated, onDocumentUpdated } = require("firebase-functions/v2/firestore");
const admin = require("firebase-admin");

admin.initializeApp();

/**
 * ----------------------------------------
 * Helpers
 * ----------------------------------------
 */

async function getUserTokens(uid) {
  const userDoc = await admin.firestore().collection("users").doc(uid).get();
  if (!userDoc.exists) return [];

  const data = userDoc.data();

  if (Array.isArray(data.fcmTokens)) return data.fcmTokens.filter(Boolean);
  if (typeof data.fcmToken === "string" && data.fcmToken.length) return [data.fcmToken];

  return [];
}

async function removeInvalidTokens(uid, tokens, multicastResponse) {
  const invalidTokens = [];

  multicastResponse.responses.forEach((r, idx) => {
    if (!r.success) invalidTokens.push(tokens[idx]);
  });

  if (!invalidTokens.length) return;

  await admin.firestore().collection("users").doc(uid).update({
    fcmTokens: admin.firestore.FieldValue.arrayRemove(...invalidTokens),
  });

  console.log("🧹 Removed invalid tokens", { uid, invalidCount: invalidTokens.length });
}

async function sendToUser(uid, payload) {
  const tokens = await getUserTokens(uid);

  if (!tokens.length) {
    console.warn("⚠️ No FCM tokens found", { uid });
    return null;
  }

  const message = {
    tokens,
    notification: payload.notification,
    data: payload.data || {},
    android: payload.android,
    apns: payload.apns,
  };

  const res = await admin.messaging().sendEachForMulticast(message);
  await removeInvalidTokens(uid, tokens, res);

  return res;
}

async function saveInboxNotification(uid, notif) {
  const notifRef = admin.firestore()
    .collection("users")
    .doc(uid)
    .collection("notifications")
    .doc();

  await notifRef.set({
    id: notifRef.id,
    ...notif,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    createdAtMs: Date.now(),
    isRead: false,
  });

  return notifRef.id;
}

/**
 * ----------------------------------------
 * 1) New Chat Message Notification
 * ----------------------------------------
 */

exports.onNewChatMessage = onDocumentCreated(
  "chats/{chatId}/messages/{messageId}",
  async (event) => {
    console.log("🔥 onNewChatMessage triggered");

    try {
      if (!event.data) return;

      const messageData = event.data.data();
      const chatId = event.params.chatId;

      if (!messageData) return;

      const { sentBy, message, message_type } = messageData;

      // Get chat document
      const chatRef = admin.firestore().collection("chats").doc(chatId);
      const chatSnap = await chatRef.get();

      if (!chatSnap.exists) return;

      const chatData = chatSnap.data();
      const members = chatData.members || [];

      const receiverId = members.find((id) => id !== sentBy);
      if (!receiverId) return;

      const senderIndex = members.indexOf(sentBy);

      let body = "New message";
      if (message_type === "text") body = message;
      if (message_type === "voice") body = "🎤 Voice message";
      if (message_type === "image") body = "📷 Image";

      const title = chatData.names?.[senderIndex] ?? "New message";

      const payload = {
        notification: { title, body },
        data: {
          type: "chat",
          chatId: String(chatId),
          uid: String(sentBy),
          name: String(chatData.names?.[senderIndex] ?? ""),
          currentUName: String(chatData.names?.[senderIndex === 0 ? 1 : 0] ?? ""),
          photoUrl: String(chatData.photos?.[senderIndex] ?? ""),
          lastMessage: String(body),
          status: String(chatData.status ?? ""),
          unreadCount: String(chatData.unreadCounts?.[receiverId] ?? 0),
          updatedAt: String(Date.now()),
        },
        android: {
          priority: "high",
          notification: {
            sound: "default",
            channelId: "chat_channel",
          },
        },
        apns: {
          payload: {
            aps: {
              sound: "default",
              badge: 1,
            },
          },
        },
      };

      console.log("🚀 Sending message notification", { receiverId, chatId });

      const res = await sendToUser(receiverId, payload);

      console.log("✅ Message multicast sent", {
        receiverId,
        successCount: res?.successCount ?? 0,
        failureCount: res?.failureCount ?? 0,
      });

      // Save notification to inbox
      try {
        await saveInboxNotification(receiverId, {
          type: "chat",
          chatId: String(chatId),
          senderId: String(sentBy),
          title,
          body,
          data: payload.data,
        });

        console.log("📥 Message notification saved to inbox", { receiverId, chatId });
      } catch (e) {
        console.error("❌ Failed to save message notification", {
          receiverId,
          chatId,
          error: e.message,
        });
      }
    } catch (error) {
      console.error("❌ Error in onNewChatMessage", {
        message: error.message,
        stack: error.stack,
      });
    }
  }
);

/**
 * ----------------------------------------
 * 2) Chat Request Created (Pending)
 * ----------------------------------------
 */

exports.onChatRequestCreated = onDocumentCreated(
  "chats/{chatId}",
  async (event) => {
    console.log("🔥 onChatRequestCreated triggered");

    try {
      if (!event.data) return;

      const chatData = event.data.data();
      const chatId = event.params.chatId;

      if (!chatData) return;

      // لازم يكون Request
      if (chatData.status !== "Pending") return;

      const fromUserId = chatData.fromUserId;
      const toUserId = chatData.toUserId;

      const members = chatData.members || [];
      const senderIndex = members.indexOf(fromUserId);

      const senderName = chatData.names?.[senderIndex] ?? "Someone";

      const title = "New connection request";
      const body = `${senderName} sent you a request`;

      const payload = {
        notification: { title, body },
        data: {
          type: "connection_request",
          chatId: String(chatId),
          fromUserId: String(fromUserId),
          toUserId: String(toUserId),
          status: "Pending",
        },
        android: {
          priority: "high",
          notification: {
            sound: "default",
            channelId: "chat_channel",
          },
        },
        apns: {
          payload: {
            aps: {
              sound: "default",
              badge: 1,
            },
          },
        },
      };

      console.log("🚀 Sending request notification", { toUserId, chatId });

      const res = await sendToUser(toUserId, payload);

      console.log("✅ Request multicast sent", {
        toUserId,
        successCount: res?.successCount ?? 0,
        failureCount: res?.failureCount ?? 0,
      });

      // Save notification to inbox
      try {
        await saveInboxNotification(toUserId, {
          type: "connection_request",
          chatId: String(chatId),
          senderId: String(fromUserId),
          title,
          body,
          data: payload.data,
        });

        console.log("📥 Request notification saved", { toUserId, chatId });
      } catch (e) {
        console.error("❌ Failed to save request notification", {
          toUserId,
          chatId,
          error: e.message,
        });
      }
    } catch (error) {
      console.error("❌ Error in onChatRequestCreated", {
        message: error.message,
        stack: error.stack,
      });
    }
  }
);

/**
 * ----------------------------------------
 * 3) Chat Request Status Updated (Accepted / Rejected)
 * ----------------------------------------
 */

exports.onChatRequestStatusUpdated = onDocumentUpdated(
  "chats/{chatId}",
  async (event) => {
    console.log("🔥 onChatRequestStatusUpdated triggered");

    try {
      if (!event.data) return;

      const before = event.data.before.data();
      const after = event.data.after.data();
      const chatId = event.params.chatId;

      if (!before || !after) return;

      // لو status متغيرش
      if (before.status === after.status) return;

      const fromUserId = after.fromUserId;
      const toUserId = after.toUserId;

      // هنرسل لمين؟
      // Accept/Reject بيتبعت للـ fromUserId
      const receiverId = fromUserId;

      const members = after.members || [];
      const toIndex = members.indexOf(toUserId);
      const toName = after.names?.[toIndex] ?? "Someone";

      let title = "";
      let body = "";
      let notifType = "";

      if (after.status === "Accepted") {
        title = "Request accepted 🎉";
        body = `${toName} accepted your request`;
        notifType = "connection_accepted";
      } else if (after.status === "Rejected") {
        title = "Request rejected";
        body = `${toName} rejected your request`;
        notifType = "connection_rejected";
      } else {
        return;
      }

      const payload = {
        notification: { title, body },
        data: {
          type: notifType,
          chatId: String(chatId),
          fromUserId: String(fromUserId),
          toUserId: String(toUserId),
          status: String(after.status),
        },
        android: {
          priority: "high",
          notification: {
            sound: "default",
            channelId: "chat_channel",
          },
        },
        apns: {
          payload: {
            aps: {
              sound: "default",
              badge: 1,
            },
          },
        },
      };

      console.log("🚀 Sending status notification", {
        receiverId,
        chatId,
        status: after.status,
      });

      const res = await sendToUser(receiverId, payload);

      console.log("✅ Status multicast sent", {
        receiverId,
        successCount: res?.successCount ?? 0,
        failureCount: res?.failureCount ?? 0,
      });

      // Save notification to inbox
      try {
        await saveInboxNotification(receiverId, {
          type: notifType,
          chatId: String(chatId),
          senderId: String(toUserId),
          title,
          body,
          data: payload.data,
        });

        console.log("📥 Status notification saved", {
          receiverId,
          chatId,
          status: after.status,
        });
      } catch (e) {
        console.error("❌ Failed to save status notification", {
          receiverId,
          chatId,
          error: e.message,
        });
      }
    } catch (error) {
      console.error("❌ Error in onChatRequestStatusUpdated", {
        message: error.message,
        stack: error.stack,
      });
    }
  }
);
