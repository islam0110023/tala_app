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
