part of 'terms_conditions_cubit.dart';

@immutable
sealed class TermsConditionsState {}

final class TermsConditionsInitial extends TermsConditionsState {}
final class TermsConditionsLoading extends TermsConditionsState {}
final class TermsConditionsSuccess extends TermsConditionsState {

  TermsConditionsSuccess(this.model);
  final PrivacyPolicyModel model;
}
final class TermsConditionsFailure extends TermsConditionsState {
  TermsConditionsFailure(this.message);
  final String message;
}
