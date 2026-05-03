import 'package:hive/hive.dart';
import 'package:tala_app/feature/home/data/model/event_model/event_model.dart';

class FavoriteService {
  final Box box = Hive.box('favoriteEventBox');

  List<EventModel> getFavorites() {
    return box.values.map((event) {
      final map = Map<String, dynamic>.from(event as Map);
      return EventModel.fromJsonCache(map);
    }).toList();
  }

  bool isFavorite(String eventId) {
    return box.containsKey(eventId);
  }

  void toggleFavorite(EventModel event) {
    if (isFavorite(event.id)) {
      box.delete(event.id);
    } else {
      box.put(event.id, event.toJson());
    }
  }
}
