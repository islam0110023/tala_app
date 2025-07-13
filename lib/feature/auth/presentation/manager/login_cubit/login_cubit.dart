import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/usecases/log_in_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  LoginEntity? loginEntity;

  Future<void> login(LoginParam param) async {
    emit(LoginLoading());
    final result = await loginUseCase.call(param);
    result.fold(
      (l) {
        emit(LoginFailure(l.errMessage));
      },
      (r) {
        loginEntity = r;
        emit(LoginSuccess());
      },
    );
  }
}
