String buildUserProfileText({
  required String name,
  required String gender,
  required String age,
  required String location,
  required String musicType,
  required String passions,
  required String musicEvent,
  required String favoriteArtists,
  required String concertFrequency,
  required bool likesDiscovering,
  required String concertVenue,
  required String enjoyTravelling,
  required String kindPerson,
  required String discoveringMusic,
  required String farAway,
  required String attendingWith,
}) {
  return '''
Name: $name
Gender: $gender
Age: $age
Location: $location

Music:
- Genres: $musicType
- Live Music Events Never Miss: $musicEvent
- Favorite Artists: $favoriteArtists
- Frequency of Attending Concerts: $concertFrequency
- Discovering New Music: ${likesDiscovering? 'Yes' : 'No'}
- Favorite Events Venue: $concertVenue

Personality:
- Passions: $passions
- Willingness to Travel: $enjoyTravelling
- Type of Hangout with: $kindPerson
- Discover Music Through: $discoveringMusic
- Distant/Far Travel: $farAway
- Prefer Go With: $attendingWith
''';
}

