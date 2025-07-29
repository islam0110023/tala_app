part of 'open_ai_cubit.dart';

@immutable
sealed class OpenAiState {}

final class OpenAiInitial extends OpenAiState {}
final class OpenAiLoading extends OpenAiState {}
final class OpenAiSuccess extends OpenAiState {}
final class OpenAiFailure extends OpenAiState {
  OpenAiFailure(this.errMessage);
  final String errMessage;
}
