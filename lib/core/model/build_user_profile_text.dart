import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/core/utils/constants.dart';

String buildUserProfileText(UserModel userModel) {
  final profile = userModel.profile!;
  final musicLike = userModel.musicLike!;
  final personality = userModel.personality!;
  return '''
  My name is ${profile.name}, I live in ${profile.location}, and I am ${AppConstant.calculateAge(profile.dateOfBirth)} years old.  
I enjoy listening to ${userModel.musicType!.join(', ')} music and I usually attend events like ${musicLike.musicEvent.join(', ')}.  
My favorite artists include: ${musicLike.favoriteArtists}. I often go to concerts at ${musicLike.concertVenue},  
and I ${musicLike.likesDiscovering ? 'love discovering new music' : 'don’t usually explore new music'}.

When it comes to personality, my passions are: ${userModel.passions!.join(', ')}.  
I enjoy traveling: ${personality.enjoyTravelling.join(', ')}, and love hanging out with: ${personality.kindPerson.join(', ')}.  
I usually discover music through: ${personality.discoveringMusic.join(', ')},  
and I prefer attending distant events with: ${personality.attendingWith.join(', ')}.
''';
}
