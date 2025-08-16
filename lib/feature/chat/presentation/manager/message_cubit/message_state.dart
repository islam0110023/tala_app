part of 'message_cubit.dart';

@immutable
class MessageState {
  MessageState({this.errMessage, required this.messages, this.isLoading = false});
  final List<Message> messages;
  final bool isLoading;
  final String? errMessage;

  MessageState copyWith({
    List<Message>? messages,
    bool? isLoading,
    String? errMessage,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}
