import 'dart:async';

import 'package:chatview/chatview.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/chat/domain/params/send_message_param.dart';
import 'package:tala_app/feature/chat/domain/params/update_message_status_params.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_messages_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/send_message_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/update_message_status_use_case.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit(
    this.sendMessageUseCase,
    this.getMessagesUseCase,
    this.updateMessageStatusUseCase,
  ) : super(MessageState(messages: const []));
  final SendMessageUseCase sendMessageUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  final UpdateMessageStatusUseCase updateMessageStatusUseCase;
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

  void isConnection() {
    emit(state.copyWith(isConnection: false));
  }

  void sendMessage(String chatId, Message message) {
    final tempList = List<Message>.from(state.messages)..add(message);
    emit(state.copyWith(messages: tempList));

    sendMessageUseCase(SendMessageParam(chatId: chatId, message: message)).then(
      (either) {
        either.fold(
          (failure) {
            _updateMessageStatus(message.id, MessageStatus.undelivered);
            updateMessageStatusUseCase(
              UpdateMessageStatusParams(
                chatId: chatId,
                messageId: message.id,
                newStatus: MessageStatus.undelivered,
              ),
            );
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
    final updated = List<Message>.from(oldMessages);

    for (final newMsg in newMessages) {
      final index = updated.indexWhere((m) => m.id == newMsg.id);
      if (index == -1) {
        updated.add(newMsg);
      } else if (updated[index] != newMsg) {
        updated[index] = newMsg;
      }
    }

    return updated;
  }

  @override
  Future<void> close() {
    messagesSub?.cancel();
    return super.close();
  }
}
