import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/domain/usecases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  SignUpEntity? signUpEntity;

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
  void reset() {
    emit(RegisterInitial());
  }
}
