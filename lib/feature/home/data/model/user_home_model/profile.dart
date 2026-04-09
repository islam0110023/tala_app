class Profile {

  Profile({this.dateOfBirth, this.gender, this.location, this.name});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    dateOfBirth: json['dateOfBirth'] as String?,
    gender: json['gender'] as String?,
    location: json['location'] as String?,
    name: json['name'] as String?,
  );
  String? dateOfBirth;
  String? gender;
  String? location;
  String? name;

  Map<String, dynamic> toJson() => {
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'location': location,
    'name': name,
  };
}
