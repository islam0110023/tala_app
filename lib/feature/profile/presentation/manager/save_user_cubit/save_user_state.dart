part of 'save_user_cubit.dart';

@immutable
sealed class SaveUserState {}

final class SaveUserInitial extends SaveUserState {}

final class SaveUserLoading extends SaveUserState {}

final class SaveUserSuccess extends SaveUserState {}

final class SaveUserFailure extends SaveUserState {
  SaveUserFailure(this.errMessage);

  final String errMessage;
}
