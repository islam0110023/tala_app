import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tala_app/core/utils/constants.dart';
import 'package:tala_app/feature/home/data/model/user_home_model/music_like.dart';
import 'package:tala_app/feature/home/data/model/user_home_model/personality.dart';
import 'package:tala_app/feature/home/data/model/user_home_model/profile.dart';
import 'package:tala_app/feature/home/data/model/user_home_model/usage.dart';
import 'package:tala_app/feature/home/domain/entities/user_entity.dart';

class UserHomeModel {
  UserHomeModel({
    this.bio,
    this.createdAt,
    this.disabled,
    this.email,
    this.fcmTokens,
    this.firstName,
    this.image,
    this.isComplete,
    this.lastName,
    this.musicLike,
    this.liveMusic,
    this.musicEvent,
    this.musicType,
    this.passions,
    this.personality,
    this.phone,
    this.profile,
    this.subscriptionId,
    this.uid,
    this.usage,
  });

  factory UserHomeModel.fromJson(Map<String, dynamic> json) => UserHomeModel(
    bio: json['bio'] as String?,
    createdAt: (json['createdAt'] as Timestamp?)?.toDate(),
    disabled: json['disabled'] as bool?,
    email: json['email'] as String?,
    fcmTokens: json['fcmTokens'] as List<dynamic>?,
    firstName: json['firstName'] as String?,
    image: json['image'] as String?,
    isComplete: json['isComplete'] as bool?,
    lastName: json['lastName'] as String?,

    musicLike: json['musicLike'] == null
        ? null
        : MusicLike.fromJson(json['musicLike']),

    liveMusic: json['liveMusic'] == null
        ? []
        : List<String>.from(json['liveMusic']),

    musicEvent: json['musicEvent'] == null
        ? []
        : List<String>.from(json['musicEvent']),

    musicType: json['musicType'] == null
        ? []
        : List<String>.from(json['musicType']),

    passions: json['passions'] == null
        ? []
        : List<String>.from(json['passions']),

    personality: json['personality'] == null
        ? null
        : Personality.fromJson(json['personality']),

    phone: json['phone'] as String?,
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile']),

    subscriptionId: json['subscriptionId'],
    uid: json['uid'] as String?,

    usage: json['usage'] == null
        ? null
        : Usage.fromJson(json['usage']),
  );
  String? bio;
  DateTime? createdAt;
  bool? disabled;
  String? email;
  List<dynamic>? fcmTokens;
  String? firstName;
  String? image;
  bool? isComplete;
  String? lastName;
  MusicLike? musicLike;
  List<String>? liveMusic;
  List<String>? musicEvent;
  List<String>? musicType;
  List<String>? passions;
  Personality? personality;
  String? phone;
  Profile? profile;
  dynamic subscriptionId;
  String? uid;
  Usage? usage;

  Map<String, dynamic> toJson() => {
    'bio': bio,
    'createdAt': createdAt,
    'disabled': disabled,
    'email': email,
    'fcmTokens': fcmTokens,
    'firstName': firstName,
    'image': image,
    'isComplete': isComplete,
    'lastName': lastName,
    'musicLike': musicLike?.toJson(),
    'liveMusic': liveMusic,
    'musicEvent': musicEvent,
    'musicType': musicType,
    'passions': passions,
    'personality': personality?.toJson(),
    'phone': phone,
    'profile': profile?.toJson(),
    'subscriptionId': subscriptionId,
    'uid': uid,
    'usage': usage?.toJson(),
  };
  UserEntity toEntity() {
    return UserEntity(
      uid: uid!,
      name: profile?.name ?? '',
      age: AppConstant.calculateAge(profile?.dateOfBirth),
      gender: profile?.gender ?? '',
      location: profile?.location ?? '',
      image: image ?? '',
      passions: passions ?? [],
      musicType: musicType ?? [],
      favoriteArtist: musicLike?.favoriteArtists ?? '',
      bio: bio ?? '',
      phoneNumber: phone ?? '',
    );
  }
}
