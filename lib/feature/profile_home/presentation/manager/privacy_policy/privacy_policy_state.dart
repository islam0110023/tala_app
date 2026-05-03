part of 'privacy_policy_cubit.dart';

@immutable
sealed class PrivacyPolicyState {}

final class PrivacyPolicyInitial extends PrivacyPolicyState {}
final class PrivacyPolicyLoading extends PrivacyPolicyState {}
final class PrivacyPolicySuccess extends PrivacyPolicyState {

  PrivacyPolicySuccess(this.model);
  final PrivacyPolicyModel model;
}
final class PrivacyPolicyFailure extends PrivacyPolicyState {
  PrivacyPolicyFailure(this.message);
  final String message;
}
