part of 'get_status_cubit.dart';

@immutable
sealed class GetStatusState {}

final class GetStatusInitial extends GetStatusState {}

final class GetStatusLoading extends GetStatusState {}

final class GetStatusSuccess extends GetStatusState {}

final class GetStatusFailure extends GetStatusState {}
