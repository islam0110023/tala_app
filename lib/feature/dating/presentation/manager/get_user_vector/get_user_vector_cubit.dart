import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/dating/domain/usa_case/get_user_vector_use_case.dart';

part 'get_user_vector_state.dart';

class GetUserVectorCubit extends Cubit<GetUserVectorState> {
  GetUserVectorCubit(this.getUserVectorUseCase) : super(GetUserVectorInitial());
  final GetUserVectorUseCase getUserVectorUseCase;
  Future<void> getUserVector(String uid) async {
    emit(GetUserVectorLoading());
    final result = await getUserVectorUseCase.call(uid);
    result.fold(
      (failure) {
        emit(GetUserVectorFailure(failure.errMessage));
      },
      (vector) {
        emit(GetUserVectorSuccess(vector));
      },
    );
  }
}
