part of 'apply_connection_cubit.dart';

@immutable
sealed class ApplyConnectionState {}

final class NotConnectionInitial extends ApplyConnectionState {}

final class NotConnectionLoading extends ApplyConnectionState {}

final class NotConnectionSuccess extends ApplyConnectionState {}

final class NotConnectionFailure extends ApplyConnectionState {
  NotConnectionFailure(this.message);
  final String message;
}

final class AcceptConnectionLoading extends ApplyConnectionState {}

final class AcceptConnectionSuccess extends ApplyConnectionState {}

final class AcceptConnectionFailure extends ApplyConnectionState {
  AcceptConnectionFailure(this.message);
  final String message;
}
