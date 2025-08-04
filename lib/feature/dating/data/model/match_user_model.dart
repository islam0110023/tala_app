import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';

class MatchUserModel {
  MatchUserModel({
    required this.uid,
    required this.profileName,
    required this.profileGender,
    required this.profileDateOfBirth,
    required this.profileLocation,
    required this.favoriteArtists,
    required this.concertVenue,
    required this.likesDiscovering,
    required this.isComplete,
    required this.passions,
    required this.musicType,
    required this.musicEvent,
    required this.liveMusic,
    required this.kindPerson,
    required this.farAway,
    required this.discoveringMusic,
    required this.attendingWith,
    required this.enjoyTravelling,
    required this.image,
  });

  factory MatchUserModel.fromJson(Map<String, dynamic> json) {
    return MatchUserModel(
      uid: json['uid'] ?? '',
      profileName: json['profile_name'] ?? '',
      profileGender: json['profile_gender'] ?? '',
      profileDateOfBirth: json['profile_dateOfBirth'] ?? '',
      profileLocation: json['profile_location'] ?? '',
      favoriteArtists: json['favoriteArtists'] ?? '',
      concertVenue: json['concertVenue'] ?? '',
      likesDiscovering: json['likesDiscovering'] ?? false,
      isComplete: json['isComplete'] ?? false,
      passions: List<String>.from(json['passions'] ?? []),
      musicType: List<String>.from(json['musicType'] ?? []),
      musicEvent: List<String>.from(json['musicEvent'] ?? []),
      liveMusic: List<String>.from(json['liveMusic'] ?? []),
      kindPerson: List<String>.from(json['kindPerson'] ?? []),
      farAway: List<String>.from(json['farAway'] ?? []),
      discoveringMusic: List<String>.from(json['discoveringMusic'] ?? []),
      attendingWith: List<String>.from(json['attendingWith'] ?? []),
      enjoyTravelling: List<String>.from(json['enjoyTravelling'] ?? []),
      image: json['image'] ?? '',
    );
  }
  final String uid;
  final String profileName;
  final String profileGender;
  final String profileDateOfBirth;
  final String profileLocation;
  final String favoriteArtists;
  final String concertVenue;
  final bool likesDiscovering;
  final bool isComplete;
  final List<String> passions;
  final List<String> musicType;
  final List<String> musicEvent;
  final List<String> liveMusic;
  final List<String> kindPerson;
  final List<String> farAway;
  final List<String> discoveringMusic;
  final List<String> attendingWith;
  final List<String> enjoyTravelling;
  final String? image;

  MatchUserEntity toEntity() {
    return MatchUserEntity(
      uid: uid,
      name: profileName,
      location: profileLocation,
      passions: passions,
      old:AppConstant.calculateAge(profileDateOfBirth).toString(),
      image: image,
      gender: profileGender,
    );
  }


}
