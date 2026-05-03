part of 'event_cubit.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLoading extends EventState {}

final class EventSuccess extends EventState {
  EventSuccess(this.events);
  final List<EventModel> events;
}


final class EventFailure extends EventState {
  EventFailure(this.message);
  final String message;
}
