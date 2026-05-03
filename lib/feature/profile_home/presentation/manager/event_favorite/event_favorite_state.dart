part of 'event_favorite_cubit.dart';

@immutable
sealed class EventFavoriteState {}

final class EventFavoriteInitial extends EventFavoriteState {}

final class EventFavoriteSuccess extends EventFavoriteState {
  EventFavoriteSuccess(this.events);

  final List<EventModel> events;
}

final class NoEventFavoriteSuccess extends EventFavoriteState {}
