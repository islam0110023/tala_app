import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/home/data/model/event_model/event_model.dart';
import 'package:tala_app/feature/home/domain/use_case/get_events_use_case.dart';
import 'package:tala_app/feature/home/presentation/manager/favorite_event/favorite_event_services.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this.getEventsUseCase) : super(EventInitial()) {
    getEvents();
  }
  final GetEventsUseCase getEventsUseCase;
  final favoriteService = FavoriteService();
  Future<void> getEvents() async {
    emit(EventLoading());
    final result = await getEventsUseCase();
    result.fold((failure) => emit(EventFailure(failure.errMessage)), (events) {
      for (var event in events) {
        if (favoriteService.isFavorite(event.id)) {
          event.isFavorite = true;
        }
      }
      emit(EventSuccess(events));
    });
  }

  void toggleFavorite(EventModel event) {
    favoriteService.toggleFavorite(event);

    if (state is EventSuccess) {
      final currentEvents = (state as EventSuccess).events;

      final updatedEvents = currentEvents.map((e) {
        if (e.id == event.id) {
          return e.copyWith(isFavorite: !e.isFavorite);
        }
        return e;
      }).toList();

      emit(EventSuccess(updatedEvents));
    }
  }
}
