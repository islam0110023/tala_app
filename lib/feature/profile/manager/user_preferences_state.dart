abstract class UserPreferencesState {}

class UserPreferencesInitial extends UserPreferencesState {}

class UserPreferencesUpdated extends UserPreferencesState {

  UserPreferencesUpdated({
    required this.selectedMusicGenres,
    required this.selectedPassions,
  });
  final List<String> selectedMusicGenres;
  final List<String> selectedPassions;
}
