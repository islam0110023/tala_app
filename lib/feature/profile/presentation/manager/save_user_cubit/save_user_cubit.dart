import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/profile/domain/usa_case/save_user_usa_case.dart';

part 'save_user_state.dart';

class SaveUserCubit extends Cubit<SaveUserState> {
  SaveUserCubit(this.saveUserUsaCase) : super(SaveUserInitial());
  final SaveUserUsaCase saveUserUsaCase;
  Future<void> saveUser(UserModel user)async{
    emit(SaveUserLoading());
    final result = await saveUserUsaCase.call(user);
    result.fold(
      (l) {
        emit(SaveUserFailure(l.errMessage));
      },
      (r) {
        emit(SaveUserSuccess());
      },
    );
  }
}
