part of 'get_matches_user_cubit.dart';

@immutable
sealed class GetMatchesUserState {}

final class GetMatchesUserInitial extends GetMatchesUserState {}

final class GetMatchesUserLoaded extends GetMatchesUserState {}

final class GetMatchesUserSuccess extends GetMatchesUserState {
  GetMatchesUserSuccess(this.matches);

  final List<MatchUserEntity> matches;
}

final class GetMatchesUserFailure extends GetMatchesUserState {
  GetMatchesUserFailure(this.errMessage);
  final String errMessage;
}
