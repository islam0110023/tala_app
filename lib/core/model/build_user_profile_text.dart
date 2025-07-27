String buildUserProfileText({
  required String name,
  required String gender,
  required String age,
  required String location,
  required String musicGenres,
  required String passions,
  required String favoriteArtists,
  required String concertFrequency,
  required String discoverNewMusic,
  required String favoriteVenue,
  required String concertPreference,
  required String travelWillingness,
  required String hangingOutWithType,
  required String discoverMusicWay,
  required String distantFarTravel,
  required String friendOrDate,
}) {
  return '''
Name: $name
Gender: $gender
Age: $age
Location: $location

Music:
- Genres: $musicGenres
- Favorite Artists: $favoriteArtists
- Frequency of Attending Concerts: $concertFrequency
- Discovering New Music: $discoverNewMusic
- Favorite Venue: $favoriteVenue
- Preferred Concert Experience: $concertPreference

Personality:
- Willingness to Travel: $travelWillingness
- Type of Hangout: $hangingOutWithType
- Discover Music Through: $discoverMusicWay
- Distant/Far Travel: $distantFarTravel
- Prefer Go With: $friendOrDate

Passions: $passions
''';
}
