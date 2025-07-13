part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class SignUpLoading extends RegisterState {}
final class SignUpSuccess extends RegisterState {}
final class SignUpFailure extends RegisterState {
  SignUpFailure(this.errMessage);

  final String errMessage;
}