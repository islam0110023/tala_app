import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.profile,
    required this.passions,
    required this.musicType,
    required this.musicLike,
    required this.personality,
    this.isComplete = false,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      phone: map['phone'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      profile: UserProfile.fromMap(map['profile']),
      passions: List<String>.from(map['passions']),
      musicType: List<String>.from(map['musicType']),
      musicLike: MusicLike.fromMap(map['musicLike']),
      personality: UserPersonality.fromMap(map['personality']),
      isComplete: map['isComplete'],
    );
  }
  final String? uid;
  final String? email;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final bool? isComplete;
  final UserProfile? profile;
  final List<String>? passions;
  final List<String>? musicType;
  final MusicLike? musicLike;
  final UserPersonality? personality;

  Map<String, dynamic> toFirstMap() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'isComplete': isComplete,
      'createdAt': FieldValue.serverTimestamp()
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'isComplete': isComplete,
      'profile': profile!.toMap(),
      'passions': passions,
      'musicType': musicType,
      'musicLike': musicLike!.toMap(),
      'personality': personality!.toMap(),
    };
  }
}

class UserProfile {
  UserProfile({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.location,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'],
      gender: map['gender'],
      dateOfBirth: map['dateOfBirth'],
      location: map['location'],
    );
  }
  final String name;
  final String gender;
  final String dateOfBirth;
  final String location;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'location': location,
    };
  }
}

class MusicLike {
  MusicLike({
    required this.musicEvent,
    required this.concertVenue,
    required this.favoriteArtists,
    required this.liveMusic,
    required this.likesDiscovering,
  });

  factory MusicLike.fromMap(Map<String, dynamic> map) {
    return MusicLike(
      musicEvent: List<String>.from(map['musicEvent']),
      concertVenue: map['concertVenue'],
      favoriteArtists: map['favoriteArtists'],
      liveMusic: List<String>.from(map['liveMusic']),
      likesDiscovering: map['likesDiscovering'],
    );
  }
  final List<String> musicEvent;
  final String concertVenue;
  final String favoriteArtists;
  final List<String> liveMusic;
  final bool likesDiscovering;

  Map<String, dynamic> toMap() {
    return {
      'musicEvent': musicEvent,
      'concertVenue': concertVenue,
      'favoriteArtists': favoriteArtists,
      'liveMusic': liveMusic,
      'likesDiscovering': likesDiscovering,
    };
  }
}

class UserPersonality {
  UserPersonality({
    required this.enjoyTravelling,
    required this.kindPerson,
    required this.discoveringMusic,
    required this.attendingWith,
    required this.farAway,
  });

  factory UserPersonality.fromMap(Map<String, dynamic> map) {
    return UserPersonality(
      enjoyTravelling: List<String>.from(map['enjoyTravelling']),
      kindPerson: List<String>.from(map['kindPerson']),
      discoveringMusic: List<String>.from(map['discoveringMusic']),
      attendingWith: List<String>.from(map['attendingWith']),
      farAway: List<String>.from(map['farAway']),
    );
  }
  final List<String> enjoyTravelling;
  final List<String> kindPerson;
  final List<String> discoveringMusic;
  final List<String> attendingWith;
  final List<String> farAway;

  Map<String, dynamic> toMap() {
    return {
      'enjoyTravelling': enjoyTravelling,
      'kindPerson': kindPerson,
      'discoveringMusic': discoveringMusic,
      'attendingWith': attendingWith,
      'farAway': farAway,
    };
  }
}
