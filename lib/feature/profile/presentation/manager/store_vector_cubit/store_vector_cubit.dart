import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/profile/domain/params/pinecone_param.dart';
import 'package:tala_app/feature/profile/domain/usa_case/store_vector_in_pinecone_use_case.dart';

part 'store_vector_state.dart';

class StoreVectorCubit extends Cubit<StoreVectorState> {
  StoreVectorCubit(this.storeVectorInPineconeUseCase)
    : super(StoreVectorInitial());
  final StoreVectorInPineconeUseCase storeVectorInPineconeUseCase;
  Future<void> storeVector(PineconeParam param) async {
    emit(StoreVectorLoading());
    final result = await storeVectorInPineconeUseCase.call(param);
    result.fold(
      (failure) => emit(StoreVectorFailure(failure.errMessage)),
      (success) => emit(StoreVectorSuccess()),
    );
  }
}
