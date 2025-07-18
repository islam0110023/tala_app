import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/auth/domain/usecases/get_user_complete_use_case.dart';

part 'get_user_complete_state.dart';

class GetUserCompleteCubit extends Cubit<GetUserCompleteState> {
  GetUserCompleteCubit(this.getUserCompleteUseCase)
    : super(GetUserCompleteInitial());
  final GetUserCompleteUseCase getUserCompleteUseCase;
  Future<void> getUserComplete(String uid) async {
    emit(GetUserCompleteLoading());
    final result = await getUserCompleteUseCase.call(uid);
    result.fold(
      (l) {
        emit(GetUserCompleteFailure(l.errMessage));
      },
      (r) {
        if (r == false) {
          emit(GetUserCompleteNotComplete());
        } else {
          emit(GetUserCompleteIsComplete());
        }
      },
    );
  }
}
