import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/profile_home/data/model/privacy_policy_model.dart';
import 'package:tala_app/feature/profile_home/domain/use_case/get_privacy_policy_use_case.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  PrivacyPolicyCubit(this.getPrivacyPolicyUseCase)
    : super(PrivacyPolicyInitial()){
    getPrivacyPolicy();
  }
  final GetPrivacyPolicyUseCase getPrivacyPolicyUseCase;
  Future<void> getPrivacyPolicy() async {
    emit(PrivacyPolicyLoading());
    final result = await getPrivacyPolicyUseCase();
    result.fold(
      (failure) => emit(PrivacyPolicyFailure(failure.errMessage)),
      (model) => emit(PrivacyPolicySuccess(model)),
    );
  }
}
