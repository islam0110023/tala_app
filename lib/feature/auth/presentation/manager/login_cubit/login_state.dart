part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginEmailVerified extends LoginState {}

final class LoginFailure extends LoginState {
  LoginFailure(this.errMessage);
  final String errMessage;
}

final class LoginWithGoogleLoading extends LoginState {}

final class LoginWithGoogleSuccess extends LoginState {}

final class LoginWithGoogleFailure extends LoginState {
  LoginWithGoogleFailure(this.errMessage);
  final String errMessage;
}
