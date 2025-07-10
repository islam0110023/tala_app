import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/domain/usecases/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.registerUseCase) : super(AuthInitial());
  final RegisterUseCase registerUseCase;
  Future<void> register(RegisterParam param) async {
    emit(SignUpLoading());
    final result = await registerUseCase.call(param);
    result.fold(
      (l) {
        emit(SignUpFailure(l.errMessage));
      },
      (r) {
        emit(SignUpSuccess() );
      },
    );
  }
}
