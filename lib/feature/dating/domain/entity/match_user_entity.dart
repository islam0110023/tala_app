class MatchUserEntity {
  MatchUserEntity({
    required this.uid,
    required this.name,
    required this.location,
    required this.passions,
    required this.old,
    required this.image,
    required this.gender,
    required this.bio,
  });

  final String uid;
  final String name;
  final String location;
  final List<String> passions;
  final String old;
  final String? image;
  final String gender;
  final String bio;
}
