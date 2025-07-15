import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tala_app/core/model/user_model.dart';

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
}

class UserModelBuilder {
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

  UserModel build() {
    if (uid == null ||
        email == null ||
        phone == null ||
        firstName == null ||
        lastName == null ||
        profile == null ||
        passions == null ||
        musicType == null ||
        musicLike == null ||
        personality == null) {
      throw Exception('Some required fields are missing.');
    }

    return UserModel(
      uid: uid!,
      email: email!,
      phone: phone!,
      firstName: firstName!,
      lastName: lastName!,
      profile: profile!,
      passions: passions!,
      musicType: musicType!,
      musicLike: musicLike!,
      personality: personality!,
    );
  }
}
