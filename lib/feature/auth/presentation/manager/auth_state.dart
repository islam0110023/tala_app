part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class SignUpLoading extends AuthState {}
final class SignUpSuccess extends AuthState {}
final class SignUpFailure extends AuthState {
  SignUpFailure(this.errMessage);

  final String errMessage;
}
final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailure extends AuthState {
  LoginFailure(this.errMessage);
  final String errMessage;
}
