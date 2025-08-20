import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/chat/domain/params/update_typing_state_param.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_typing_status_use_case.dart';

part 'get_typing_state.dart';

class GetTypingCubit extends Cubit<GetTypingState> {
  GetTypingCubit(this.getTypingStatusUseCase) : super(GetTypingInitial());
  final GetTypingStatusUseCase getTypingStatusUseCase;
  StreamSubscription? streamSubscription;

  void getTypingStatus(UpdateTypingStateParam param) {
    streamSubscription?.cancel();
    streamSubscription = getTypingStatusUseCase(param).listen((isTyping) {
      isTyping.fold(
        (l) {
          emit(GetTypingInitial());
        },
        (r) {
          emit(GetTypingSuccess(r));
        },
      );
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
