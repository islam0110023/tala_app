import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/chat/domain/entities/chat_status_entity.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_chat_status_use_case.dart';

part 'get_status_state.dart';

class GetStatusCubit extends Cubit<GetStatusState> {
  GetStatusCubit(this.getChatStatusUseCase) : super(GetStatusInitial());
  final GetChatStatusUseCase getChatStatusUseCase;
  StreamSubscription? _sub;
  ChatStatusEntity chatStatus = ChatStatusEntity(
    isOnline: false,
    lastSeen: null,
  );
  void getChatStatus(String uid) {
    _sub?.cancel();
    _sub = getChatStatusUseCase(uid).listen((chatStatus) {
      chatStatus.fold(
        (failure) {
          this.chatStatus = ChatStatusEntity(isOnline: false, lastSeen: null);
          emit(GetStatusFailure());
        },
        (chatStatus) {
          this.chatStatus = chatStatus;
          emit(GetStatusSuccess());
        },
      );
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
