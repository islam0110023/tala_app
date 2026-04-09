import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class UserFormCubit extends Cubit<UserModelBuilder> {
  UserFormCubit() : super(UserModelBuilder());

  void setBasicInfo({
    required String uid,
    required String email,
    required String phone,
    required String firstName,
    required String lastName,
  }) {
    emit(
      state
        ..uid = uid
        ..email = email
        ..phone = phone
        ..firstName = firstName
        ..lastName = lastName,
    );
  }

  void setComplete() {
    emit(state..isComplete = true);
  }

  void setBio(String bio) {
    emit(state..bio = bio);
  }

  void setIncomplete() {
    emit(state..isComplete = false);
  }

  void setImage(String? image) {
    emit(state.copyWith(image: image));
  }

  void setUid(String uid) {
    emit(state..uid = uid);
  }

  void setProfile(UserProfile profile) {
    emit(state..profile = profile);
  }

  void setPassions(List<String> passions) {
    emit(state..passions = passions);
  }

  void setMusicType(List<String> musicType) {
    emit(state..musicType = musicType);
  }

  void setMusicLike(MusicLike musicLike) {
    emit(state..musicLike = musicLike);
  }

  void setPersonality(UserPersonality personality) {
    emit(state..personality = personality);
  }

  UserModel build() {
    return state.build();
  }

  UserModel firstBuild() {
    return state.firstBuild();
  }
}

class UserModelBuilder {
  UserModelBuilder({this.image});
  UserModelBuilder copyWith({String? image}) {
    return UserModelBuilder(image: image ?? this.image)
      ..uid = uid
      ..email = email
      ..phone = phone
      ..firstName = firstName
      ..lastName = lastName
      ..profile = profile
      ..passions = passions
      ..musicType = musicType
      ..musicLike = musicLike
      ..personality = personality
      ..isComplete = isComplete
      ..bio = bio
      ..fcmToken = fcmToken;
  }

  String? uid;
  String? email;
  String? phone;
  String? firstName;
  String? lastName;
  UserProfile? profile;
  List<String>? passions;
  List<String>? musicType;
  MusicLike? musicLike;
  UserPersonality? personality;
  bool? isComplete;
  String? fcmToken;
  String? image;
  String? bio;

  UserModel build() {
    if (uid == null ||
        profile == null ||
        passions == null ||
        musicType == null ||
        musicLike == null ||
        personality == null ||
        image == null) {
      throw Exception(LocaleKeys.some_required_fields_missing.tr());
    }

    return UserModel(
      uid: uid!,
      email: email,
      phone: phone,
      firstName: firstName,
      lastName: lastName,
      profile: profile!,
      passions: passions!,
      musicType: musicType!,
      musicLike: musicLike!,
      personality: personality!,
      isComplete: isComplete!,
      image: image!,
      bio: bio,
    );
  }

  UserModel firstBuild() {
    if (uid == null ||
        email == null ||
        phone == null ||
        firstName == null ||
        lastName == null) {
      throw Exception(LocaleKeys.some_required_fields_missing.tr());
    }

    return UserModel(
      uid: uid!,
      email: email!,
      phone: phone!,
      firstName: firstName!,
      lastName: lastName!,
      profile: profile,
      passions: passions,
      musicType: musicType,
      musicLike: musicLike,
      personality: personality,
      image: image,
      bio: bio,
    );
  }
}
