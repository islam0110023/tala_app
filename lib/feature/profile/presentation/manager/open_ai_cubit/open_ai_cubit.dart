import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/profile/domain/usa_case/create_vector_with_a_i_use_case.dart';

part 'open_ai_state.dart';

class OpenAiCubit extends Cubit<OpenAiState> {
  OpenAiCubit(this.createVectorWithAIUseCase) : super(OpenAiInitial());
  final CreateVectorWithAIUseCase createVectorWithAIUseCase;
  List<double>? vector;
  Future<void> createVectorWithAI(String prompt) async {
    emit(OpenAiLoading());
    final result = await createVectorWithAIUseCase.call(prompt);
    result.fold((failure) => emit(OpenAiFailure(failure.errMessage)), (data) {
      vector = data;
      emit(OpenAiSuccess());
    });
  }
}
