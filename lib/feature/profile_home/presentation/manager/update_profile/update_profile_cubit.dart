import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tala_app/feature/profile_home/domain/use_case/update_profile_use_case.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UserUpdateProfileModel> {
  UpdateProfileCubit(this.updateProfileUseCase)
    : super(UserUpdateProfileModel());
  final UpdateProfileUseCase updateProfileUseCase;
  void update(Map<String, dynamic> data) async {
    emit(state.copyWith(isLoading: true));
    final result = await updateProfileUseCase(data);
    result.fold(
      (failure) {
        emit(state.copyWith(isError: true, isLoading: false));
      },
      (data) {
        emit(state.copyWith(isSuccess: true, isLoading: false));
      },
    );
  }

  void setImage(String? image) {
    emit(state.copyWith(image: image));
  }

  void setName(String? name) {
    emit(state.copyWith(name: name));
  }

  void setGender(String? gender) {
    emit(state.copyWith(gender: gender));
  }

  void setDate(String? date) {
    emit(state.copyWith(date: date));
  }

  void setLocation(String? location) {
    emit(state.copyWith(location: location));
  }

  Map<String, dynamic> build() {
    return state.toMap();
  }

  Map<String, dynamic> build1() {
    return state.toMap1();
  }
}

class UserUpdateProfileModel {
  UserUpdateProfileModel({
    this.name,
    this.gender,
    this.date,
    this.location,
    this.image,
    this.isLoading,
    this.isError,
    this.isSuccess,
  });
  String? name;
  String? gender;
  String? date;
  String? location;
  String? image;
  bool? isLoading;
  bool? isError;
  bool? isSuccess;
  UserUpdateProfileModel copyWith({
    String? name,
    String? gender,
    String? date,
    String? location,
    String? image,
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
  }) {
    return UserUpdateProfileModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      date: date ?? this.date,
      location: location ?? this.location,
      image: image ?? this.image,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profile': {
        'name': name,
        'gender': gender,
        'date': date,
        'location': location,
      },
      'image': image,
    };
  }

  Map<String, dynamic> toMap1() {
    return <String, dynamic>{
      'profile': {
        'name': name,
        'gender': gender,
        'date': date,
        'location': location,
      },
    };
  }
}
