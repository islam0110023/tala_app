class UserEntity {

  const UserEntity({
    required this.uid,
    required this.name,
    required this.age,
    required this.gender,
    required this.location,
    required this.image,
    required this.passions,
    required this.musicType,
    required this.favoriteArtist,
    required this.bio,
    required this.phoneNumber,
  });
  final String uid;
  final String name;
  final int age;
  final String gender;
  final String location;
  final String image;
  final List<String> passions;
  final List<String> musicType;
  final String favoriteArtist;
  final String bio;
  final String phoneNumber;

}