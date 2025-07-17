import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/usecases/reset_password_use_case.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());
  final ResetPasswordUseCase resetPasswordUseCase;
  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    final result = await resetPasswordUseCase(email);
    result.fold(
      (failure) {
        emit(ResetPasswordFailure(failure.errMessage));
      },
      (success) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
