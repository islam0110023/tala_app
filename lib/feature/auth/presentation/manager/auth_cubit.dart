import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:tala_app/feature/auth/domain/usecases/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.registerUseCase, this.loginUseCase) : super(AuthInitial());
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  Future<void> register(RegisterParam param) async {
    emit(SignUpLoading());
    final result = await registerUseCase.call(param);
    result.fold(
      (l) {
        emit(SignUpFailure(l.errMessage));
      },
      (r) {
        emit(SignUpSuccess());
      },
    );
  }
  Future<void> login(LoginParam param) async {
    emit(LoginLoading());
    final result = await loginUseCase.call(param);
    result.fold(
          (l) => emit(LoginFailure(l.errMessage)),
          (r) => emit(LoginSuccess()),
    );
  }
}
