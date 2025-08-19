part of 'message_cubit.dart';

@immutable
class MessageState extends Equatable {
  MessageState({
    this.isConnection = true,
    this.errMessage,
    required this.messages,
    this.isLoading = false,
  });
  final List<Message> messages;
  final bool isLoading;
  final String? errMessage;
  final bool isConnection;

  MessageState copyWith({
    List<Message>? messages,
    bool? isLoading,
    String? errMessage,
    bool? isConnection,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
      isConnection: isConnection ?? this.isConnection,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [messages, isLoading, errMessage, isConnection];
}
