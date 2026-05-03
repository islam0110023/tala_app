import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/profile_home/data/model/privacy_policy_model.dart';
import 'package:tala_app/feature/profile_home/domain/use_case/get_terms_conditions_use_case.dart';

part 'terms_conditions_state.dart';

class TermsConditionsCubit extends Cubit<TermsConditionsState> {
  TermsConditionsCubit(this.getTermsConditionsUseCase)
    : super(TermsConditionsInitial()){
    getTermsConditions();
  }
  final GetTermsConditionsUseCase getTermsConditionsUseCase;
  Future<void> getTermsConditions() async {
    emit(TermsConditionsLoading());
    final result = await getTermsConditionsUseCase();
    result.fold(
      (failure) => emit(TermsConditionsFailure(failure.errMessage)),
      (model) => emit(TermsConditionsSuccess(model)),
    );
  }
}
