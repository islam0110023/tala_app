class MusicLike {

  MusicLike({this.concertVenue, this.favoriteArtists, this.likesDiscovering});

  factory MusicLike.fromJson(Map<String, dynamic> json) => MusicLike(
    concertVenue: json['concertVenue'] as String?,
    favoriteArtists: json['favoriteArtists'] as String?,
    likesDiscovering: json['likesDiscovering'] as bool?,
  );
  String? concertVenue;
  String? favoriteArtists;
  bool? likesDiscovering;

  Map<String, dynamic> toJson() => {
    'concertVenue': concertVenue,
    'favoriteArtists': favoriteArtists,
    'likesDiscovering': likesDiscovering,
  };
}
