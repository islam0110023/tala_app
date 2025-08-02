import 'package:tala_app/core/model/user_model.dart';

String buildUserProfileText(UserModel userModel) {
  final profile = userModel.profile!;
  final musicLike = userModel.musicLike!;
  final personality = userModel.personality!;

  return '''
Name: ${profile.name}
Gender: ${profile.gender}
Age: ${profile.dateOfBirth}
Location: ${profile.location}

Music:
- Genres: ${userModel.musicType!.join(', ')}
- Live Music Events Never Miss: ${musicLike.musicEvent.join(', ')}
- Favorite Artists: ${musicLike.favoriteArtists}
- Frequency of Attending Concerts: ${musicLike.concertVenue}
- Discovering New Music: ${musicLike.likesDiscovering ? 'Yes' : 'No'}
- Favorite Events Venue: ${musicLike.concertVenue}

Personality:
- Passions: ${userModel.passions!.join(', ')}
- Willingness to Travel: ${personality.enjoyTravelling.join(', ')}
- Type of Hangout with: ${personality.kindPerson.join(', ')}
- Discover Music Through: ${personality.discoveringMusic.join(', ')}
- Distant/Far Travel: ${personality.farAway.join(', ')}
- Prefer Go With: ${personality.attendingWith.join(', ')}
''';
}
