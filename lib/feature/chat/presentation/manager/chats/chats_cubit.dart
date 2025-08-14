import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_chats_use_case.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.getChatsUseCase) : super(ChatsInitial());
  final GetChatsUseCase getChatsUseCase;
  StreamSubscription<Either<Failure, List<ChatEntity>>>? subscription;

  void loadChats(String uid) async {
    emit(ChatsLoading());
    subscription?.cancel();

    subscription = getChatsUseCase(uid).listen((either) {
      either.fold(
        (failure) => emit(ChatsFailure(failure.errMessage)),
        (chats) => emit(ChatsSuccess(chats)),
      );
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
