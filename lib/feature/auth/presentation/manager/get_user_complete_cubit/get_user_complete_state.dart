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

final class GetUserCompleteLoadingWithSocial extends GetUserCompleteState {}

final class GetUserCompleteIsCompleteWithSocial extends GetUserCompleteState {}

final class GetUserCompleteNotCompleteWithSocial extends GetUserCompleteState {}

final class GetUserCompleteFailureWithSocial extends GetUserCompleteState {
  GetUserCompleteFailureWithSocial(this.errMessage);

  final String errMessage;
}
