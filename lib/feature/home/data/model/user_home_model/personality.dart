class Personality {

  Personality({
    this.attendingWith,
    this.discoveringMusic,
    this.enjoyTravelling,
    this.farAway,
    this.kindPerson,
  });

  factory Personality.fromJson(Map<String, dynamic> json) {
    return Personality(
      attendingWith: List<String>.from(json['attendingWith'] ?? []),
      discoveringMusic: List<String>.from(json['discoveringMusic'] ?? []),
      enjoyTravelling: List<String>.from(json['enjoyTravelling'] ?? []),
      farAway: List<String>.from(json['farAway'] ?? []),
      kindPerson: List<String>.from(json['kindPerson'] ?? []),
    );
  }
  List<String>? attendingWith;
  List<String>? discoveringMusic;
  List<String>? enjoyTravelling;
  List<String>? farAway;
  List<String>? kindPerson;

  Map<String, dynamic> toJson() => {
    'attendingWith': attendingWith,
    'discoveringMusic': discoveringMusic,
    'enjoyTravelling': enjoyTravelling,
    'farAway': farAway,
    'kindPerson': kindPerson,
  };
}
