part of 'get_user_complete_cubit.dart';

@immutable
sealed class GetUserCompleteState {}

final class GetUserCompleteInitial extends GetUserCompleteState {}

final class GetUserCompleteLoading extends GetUserCompleteState {}

final class GetUserCompleteIsComplete extends GetUserCompleteState {}

final class GetUserCompleteNotComplete extends GetUserCompleteState {}

final class GetUserCompleteFailure extends GetUserCompleteState {
  GetUserCompleteFailure(this.errMessage);

  final String errMessage;
}
