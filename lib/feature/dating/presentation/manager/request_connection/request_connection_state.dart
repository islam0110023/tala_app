part of 'request_connection_cubit.dart';

@immutable
sealed class RequestConnectionState {}

final class RequestConnectionInitial extends RequestConnectionState {}
final class RequestConnectionLoading extends RequestConnectionState {}
final class RequestConnectionSuccess extends RequestConnectionState {}
final class RequestConnectionFailure extends RequestConnectionState {
  RequestConnectionFailure(this.errMessage);

  final String errMessage;
}
