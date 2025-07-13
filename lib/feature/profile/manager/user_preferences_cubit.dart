import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/feature/profile/manager/user_preferences_state.dart';

class UserPreferencesCubit extends Cubit<UserPreferencesState> {

  UserPreferencesCubit() : super(UserPreferencesInitial());
  List<String> _musicGenres = [];
  List<String> _passions = [];

  void selectMusicGenre(String genre) {
    if (_musicGenres.contains(genre)) {
      _musicGenres.remove(genre);
    } else if (_musicGenres.length < 5) {
      _musicGenres.add(genre);
    }
    _emitUpdated();
  }

  void selectPassion(String passion) {
    if (_passions.contains(passion)) {
      _passions.remove(passion);
    } else if (_passions.length < 5) {
      _passions.add(passion);
    }
    _emitUpdated();
  }

  void _emitUpdated() {
    emit(UserPreferencesUpdated(
      selectedMusicGenres: List.from(_musicGenres),
      selectedPassions: List.from(_passions),
    ));
  }
}
