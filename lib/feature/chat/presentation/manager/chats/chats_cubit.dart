import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_chats_use_case.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.getChatsUseCase) : super(ChatsInitial());
  final GetChatsUseCase getChatsUseCase;
  StreamSubscription<Either<Failure, List<ChatEntity>>>? subscription;
  List<ChatEntity> allChats = [];
  void loadChats(String uid) async {
    final box = Hive.box('chatsBox');

    final cached = box.get(uid);

    if (cached != null) {
      final chats =
          (cached as List)
              .map((e) => Map<String, dynamic>.from(e as Map))
              .map((e) => ChatEntity.fromJson(e))
              .toList()
            ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

      emit(ChatsSuccess(chats));
      allChats = chats;
    } else {
      emit(ChatsLoading());
    }

    subscription?.cancel();

    subscription = getChatsUseCase(uid).listen((either) {
      either.fold((failure) => emit(ChatsFailure(failure.errMessage)), (chats) {
        emit(ChatsSuccess(chats));
        allChats = chats;
        _cacheChats(uid, chats);
      });
    });
  }

  void searchChats(String query) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) {
      emit(ChatsSuccess(allChats));
      return;
    }

    final filtered = List<ChatEntity>.from(allChats).where((chat) {
      final name = (chat.name ?? '').toLowerCase();
      return name.contains(q);
    }).toList();
    emit(ChatsSuccess(filtered));
  }

  Future<void> _cacheChats(String uid, List<ChatEntity> chats) async {
    final box = Hive.box('chatsBox');

    final unique = {
      for (final chat in chats) chat.chatId: chat,
    }.values.toList();

    final limited = unique.take(50).toList();

    final data = limited.map((e) => e.toJson()).toList();

    await box.put(uid, data);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
