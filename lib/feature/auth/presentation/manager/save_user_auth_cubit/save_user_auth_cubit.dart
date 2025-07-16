import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/auth/domain/usecases/save_user_auth_use_case.dart';

part 'save_user_auth_state.dart';

class SaveUserAuthCubit extends Cubit<SaveUserAuthState> {
  SaveUserAuthCubit(this.saveUserAuthUsaCase) : super(SaveUserAuthInitial());
  final SaveUserAuthUseCase saveUserAuthUsaCase;
  Future<void> saveUser(UserModel user)async{
    emit(SaveUserAuthLoading());
    final result = await saveUserAuthUsaCase.call(user);
    result.fold(
      (l) {
        emit(SaveUserAuthFailure(l.errMessage));
      },
      (r) {
        emit(SaveUserAuthSuccess());
      },
    );
  }

}
