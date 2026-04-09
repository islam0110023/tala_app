part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

final class ChatsLoading extends ChatsState {}

final class ChatsSuccess extends ChatsState {
  ChatsSuccess(this.chats);

  final List<ChatEntity> chats;
}

final class ChatsFailure extends ChatsState {
  ChatsFailure(this.errMessage);
  final String errMessage;
}
