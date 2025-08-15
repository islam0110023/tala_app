import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/chat/domain/usa_case/accept_connection_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/not_connection_use_case.dart';

part 'apply_connection_state.dart';

class ApplyConnectionCubit extends Cubit<ApplyConnectionState> {
  ApplyConnectionCubit(this.notConnectionUseCase, this.acceptConnectionUseCase)
    : super(NotConnectionInitial());
  final NotConnectionUseCase notConnectionUseCase;
  final AcceptConnectionUseCase acceptConnectionUseCase;
  Future<void> notConnection(String chatId) async {
    emit(NotConnectionLoading());
    final failureOrSuccess = await notConnectionUseCase(chatId);
    failureOrSuccess.fold(
      (failure) => emit(NotConnectionFailure(failure.errMessage)),
      (success) => emit(NotConnectionSuccess()),
    );
  }

  Future<void> acceptConnection(String chatId) async {
    emit(AcceptConnectionLoading());
    final failureOrSuccess = await acceptConnectionUseCase(chatId);
    failureOrSuccess.fold(
      (failure) => emit(AcceptConnectionFailure(failure.errMessage)),
      (success) => emit(AcceptConnectionSuccess()),
    );
  }
}
