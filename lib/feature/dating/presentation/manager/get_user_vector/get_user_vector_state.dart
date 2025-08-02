part of 'get_user_vector_cubit.dart';

@immutable
sealed class GetUserVectorState {}

final class GetUserVectorInitial extends GetUserVectorState {}

final class GetUserVectorLoading extends GetUserVectorState {}

final class GetUserVectorSuccess extends GetUserVectorState {
  GetUserVectorSuccess(this.userData);

  final UserDataEntity userData;
}

final class GetUserVectorFailure extends GetUserVectorState {
  GetUserVectorFailure(this.errMessage);
  final String errMessage;
}
