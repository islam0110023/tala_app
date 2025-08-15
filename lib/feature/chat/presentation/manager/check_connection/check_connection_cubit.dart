import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/chat/domain/usa_case/check_connection_use_case.dart';

part 'check_connection_state.dart';

class CheckConnectionCubit extends Cubit<CheckConnectionState> {
  CheckConnectionCubit(this.checkConnectionUseCase)
    : super(CheckConnectionInitial());
  final CheckConnectionUseCase checkConnectionUseCase;
  Future<void> checkConnection(String uid) async {
    emit(CheckConnectionLoading());
    final result = await checkConnectionUseCase.call(uid);
    result.fold(
      (l) {
        emit(CheckConnectionFailure());
      },
      (r) {
        if (r.isConnection == true) {
          emit(CheckConnectionIsConnection());
        } else {
          if (r.fromUserId == uid) {
            emit(CheckConnectionNotConnection());
          } else {
            emit(CheckConnectionNoConnectionFromUser());
          }
        }
      },
    );
  }
}
