part of 'get_typing_cubit.dart';

@immutable
sealed class GetTypingState {}

final class GetTypingInitial extends GetTypingState {}
final class GetTypingSuccess extends GetTypingState {
  GetTypingSuccess(this.isTyping);

  final bool isTyping;
}

