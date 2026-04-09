import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/feature/home/data/model/user_home_model/user_home_model.dart';
import 'package:tala_app/feature/home/domain/entities/user_entity.dart';

abstract class HomeRemoteDataSource {
  Future<UserEntity> getUser();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<UserEntity> getUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      throw Exception('User not logged in');
    }
    final data =await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    return UserHomeModel.fromJson(data.data()!).toEntity();
  }
}
