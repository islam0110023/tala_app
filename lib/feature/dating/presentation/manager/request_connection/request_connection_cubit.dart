import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/dating/domain/params/request_params.dart';
import 'package:tala_app/feature/dating/domain/usa_case/request_connection_use_case.dart';

part 'request_connection_state.dart';

class RequestConnectionCubit extends Cubit<RequestConnectionState> {
  RequestConnectionCubit(this.requestConnectionUseCase)
    : super(RequestConnectionInitial());
  final RequestConnectionUseCase requestConnectionUseCase;
  Future<void> requestConnection(RequestParams params) async {
    emit(RequestConnectionLoading());
    final result = await requestConnectionUseCase(params);
    result.fold(
      (failure) => emit(RequestConnectionFailure(failure.errMessage)),
      (success) => emit(RequestConnectionSuccess()),
    );
  }
}
