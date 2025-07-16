part of 'save_user_auth_cubit.dart';

@immutable
sealed class SaveUserAuthState {}

final class SaveUserAuthInitial extends SaveUserAuthState {}
final class SaveUserAuthLoading extends SaveUserAuthState {}
final class SaveUserAuthSuccess extends SaveUserAuthState {}
final class SaveUserAuthFailure extends SaveUserAuthState {
  SaveUserAuthFailure(this.errMessage);
  final String errMessage;
}


