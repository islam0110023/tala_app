part of 'check_connection_cubit.dart';

@immutable
sealed class CheckConnectionState {}

final class CheckConnectionInitial extends CheckConnectionState {}

final class CheckConnectionLoading extends CheckConnectionState {}

final class CheckConnectionIsConnection extends CheckConnectionState {}

final class CheckConnectionNotConnection extends CheckConnectionState {}

final class CheckConnectionNoConnectionFromUser extends CheckConnectionState {}

final class CheckConnectionFailure extends CheckConnectionState {}
