import 'dart:async';

import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/chat/domain/params/mark_as_params.dart';
import 'package:tala_app/feature/chat/domain/params/send_message_param.dart';
import 'package:tala_app/feature/chat/domain/params/update_message_status_params.dart';
import 'package:tala_app/feature/chat/domain/params/update_typing_state_param.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_messages_page_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_messages_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/listen_to_new_messages_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/mark_messages_as_read_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/mark_notification_as_read_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/send_message_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/send_reaction_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/update_message_status_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/update_typing_state_use_case.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit(
    this.sendMessageUseCase,
    this.getMessagesUseCase,
    this.updateMessageStatusUseCase,
    this.markMessagesAsReadUseCase,
    this.sendReactionUseCase,
    this.updateTypingStatusUseCase,
    this.markNotificationAsReadUseCase,
    this.getMessagesPageUseCase,
    this.listenToNewMessagesUseCase,
  ) : super(MessageState(messages: const []));
  final SendMessageUseCase sendMessageUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  final UpdateMessageStatusUseCase updateMessageStatusUseCase;
  final MarkMessagesAsReadUseCase markMessagesAsReadUseCase;
  final SendReactionUseCase sendReactionUseCase;
  final UpdateTypingStateUseCase updateTypingStatusUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;
  final GetMessagesPageUseCase getMessagesPageUseCase;
  final ListenToNewMessagesUseCase listenToNewMessagesUseCase;
  DocumentSnapshot? lastDoc;
  bool hasMore = true;
  bool isLoadingMore = false;
  StreamSubscription? newMessagesSub;

  StreamSubscription? messagesSub;
  void loadMessages(String chatId) {
    emit(state.copyWith(isLoading: true));
    messagesSub?.cancel();
    messagesSub = getMessagesUseCase(chatId).listen((messages) {
      messages.fold(
        (failure) {
          emit(
            state.copyWith(isLoading: false, errMessage: failure.errMessage),
          );
        },
        (messages) {
          //emit(state.copyWith(messages: messages, isLoading: false));
          final updatedMessages = mergeMessages(state.messages, messages);
          emit(state.copyWith(messages: updatedMessages, isLoading: false));
        },
      );
    });
  }

  Future<void> loadInitialMessages(String chatId) async {
    emit(state.copyWith(isLoading: true));
    final box = Hive.box('messagesBox');

    final cached = box.get(chatId);

    if (cached != null) {
      final cachedMessages =
          (cached as List)
              .map((e) => Map<String, dynamic>.from(e as Map))
              .map((e) => Message.fromJson(e))
              .toList()
            ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
      emit(state.copyWith(messages: cachedMessages, isLoading: false));
    }

    final result = await getMessagesPageUseCase(chatId: chatId);
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errMessage: failure.errMessage));
      },
      (message) async {
        final messages = message.$1;
        lastDoc = message.$2;

        if (messages.length < 20) {
          hasMore = false;
        }

        if (messages.isEmpty) {
          await Hive.box('messagesBox').delete(chatId);
         // messagesSub?.cancel();

          emit(state.copyWith(messages: [], isLoading: false));
          // return;
        } else {
          /// ✅ replace مش merge
          emit(state.copyWith(
            messages: messages,
            isLoading: false,
          ));
          _cacheMessages(chatId, messages);

          newMessagesSub?.cancel();
          newMessagesSub = listenToNewMessagesUseCase(chatId).listen((
            newMessages,
          ) {
            newMessages.fold(
              (failure) {
                emit(
                  state.copyWith(
                    errMessage: failure.errMessage,
                    isLoading: false,
                  ),
                );
              },
              (newMessages) {
                final updated = mergeMessages(state.messages, newMessages);
                emit(state.copyWith(messages: updated, isLoading: false));
                _cacheMessages(chatId, updated);
              },
            );
          });
        }
      },
    );
  }

  Future<void> loadMoreMessages(String chatId) async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;

    final result = await getMessagesPageUseCase(
      chatId: chatId,
      lastDoc: lastDoc,
    );
    result.fold(
      (l) {
        emit(state.copyWith(errMessage: l.errMessage, isLoading: false));
      },
      (message) {
        final newMessages = message.$1;
        lastDoc = message.$2;

        if (newMessages.isEmpty) {
          hasMore = false;
        }

        final updated = List<Message>.from(state.messages)..addAll(newMessages);

        emit(state.copyWith(messages: updated, isLoading: false));
        _cacheMessages(chatId, updated);

        isLoadingMore = false;
      },
    );
  }

  Future<void> _cacheMessages(String chatId, List<Message> messages) async {
    final box = Hive.box('messagesBox');

    final existing = box.get(chatId);

    List<Map<String, dynamic>> old = [];

    if (existing != null) {
      old = (existing as List)
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
    }

    final newData = messages.map((e) => e.toJson()).toList();

    final merged = [...old, ...newData];

    final unique = {for (final msg in merged) msg['id']: msg}.values.toList();
    final limited = unique.take(100).toList();
    await box.put(chatId, limited);
  }

  void isConnection() {
    emit(state.copyWith(isConnection: false));
  }

  void sendMessage(String chatId, Message message, String uid) async {
    final tempList = List<Message>.from(state.messages)..add(message);
    emit(state.copyWith(messages: tempList));
    _cacheMessages(chatId, tempList);

    final either = await sendMessageUseCase(
      SendMessageParam(uid: uid, chatId: chatId, message: message),
    );
    either.fold(
      (failure) {
        _updateMessageStatus(message.id, MessageStatus.undelivered);
        emit(state.copyWith(errMessage: failure.errMessage));
        emit(state.copyWith(errMessage: null));
      },
      (_) {
        _updateMessageStatus(message.id, MessageStatus.delivered);
        updateMessageStatusUseCase(
          UpdateMessageStatusParams(
            chatId: chatId,
            messageId: message.id,
            newStatus: MessageStatus.delivered,
          ),
        );
      },
    );
  }

  void _updateMessageStatus(String messageId, MessageStatus newStatus) {
    final updatedList = state.messages.map((msg) {
      if (msg.id == messageId && msg.status != newStatus) {
        return msg.copyWith(status: newStatus);
      }
      return msg;
    }).toList();

    emit(state.copyWith(messages: updatedList));
  }

  List<Message> mergeMessages(
    List<Message> oldMessages,
    List<Message> newMessages,
  ) {
    final updated = <Message>[];

    for (final newMsg in newMessages) {
      final index = oldMessages.indexWhere((m) => m.id == newMsg.id);
      if (index == -1) {
        updated.add(newMsg);
      } else if (oldMessages[index] != newMsg) {
        updated.add(newMsg);
      } else {
        updated.add(oldMessages[index]);
      }
    }

    return updated;
  }

  Future<void> markMessagesAsRead(String chatId, String uid) async {
    await markMessagesAsReadUseCase(MarkAsParams(chatId: chatId, uid: uid));
  }

  Future<void> markNotificationAsRead(String chatId) async {
    await markNotificationAsReadUseCase(chatId);
  }

  Future<void> sendReaction(String chatId, Message message, String uid) async {
    await sendReactionUseCase(
      SendMessageParam(chatId: chatId, uid: uid, message: message),
    );
  }

  Future<void> updateTypingStatus(
    String chatId,
    String uid,
    bool isTyping,
  ) async {
    await updateTypingStatusUseCase(
      UpdateTypingStateParam(chatId: chatId, uid: uid, isTyping: isTyping),
    );
  }

  @override
  Future<void> close() {
    messagesSub?.cancel();
    newMessagesSub?.cancel();
    return super.close();
  }
}
