import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/home/data/model/event_model/event_model.dart';
import 'package:tala_app/feature/home/presentation/manager/favorite_event/favorite_event_services.dart';

part 'event_favorite_state.dart';

class EventFavoriteCubit extends Cubit<EventFavoriteState> {
  EventFavoriteCubit() : super(EventFavoriteInitial()) {
    getFavoriteEvents();
  }

  final favoriteService = FavoriteService();

  void getFavoriteEvents() {
    final favoriteEvents = favoriteService.getFavorites();
    if (favoriteEvents.isEmpty) {
      emit(NoEventFavoriteSuccess());
      return;
    }
    for (var event in favoriteEvents) {
      if (favoriteService.isFavorite(event.id)) {
        event.isFavorite = true;
      }
    }
    emit(EventFavoriteSuccess(favoriteEvents));
  }

  void toggleFavorite(EventModel event) {
    favoriteService.toggleFavorite(event);

    if (state is EventFavoriteSuccess) {
      final currentEvents = (state as EventFavoriteSuccess).events;

      final updatedEvents = currentEvents.map((e) {
        if (e.id == event.id) {
          return e.copyWith(isFavorite: !e.isFavorite);
        }
        return e;
      }).toList();

      emit(EventFavoriteSuccess(updatedEvents));
    }
  }
}
