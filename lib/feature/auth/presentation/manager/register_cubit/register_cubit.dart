import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/domain/usecases/login_with_google_use_case.dart';
import 'package:tala_app/feature/auth/domain/usecases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase, this.loginWithGoogleUseCase)
    : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  SignUpEntity? signUpEntity;
  LoginEntity? registerEntity;

  Future<void> register(RegisterParam param) async {
    emit(SignUpLoading());
    final result = await registerUseCase.call(param);
    result.fold(
      (l) {
        emit(SignUpFailure(l.errMessage));
      },
      (r) {
        signUpEntity = r;
        emit(SignUpSuccess());
      },
    );
  }

  Future<void> registerWithGoogle() async {
    emit(SignUpWithGoogleLoading());

    final result = await loginWithGoogleUseCase.call();
    result.fold(
      (l) {
        emit(SignUpWithGoogleFailure(l.errMessage));
      },
      (r) {
        registerEntity = r;
        emit(SignUpWithGoogleSuccess());
      },
    );
  }

  void reset() {
    emit(RegisterInitial());
  }
}
