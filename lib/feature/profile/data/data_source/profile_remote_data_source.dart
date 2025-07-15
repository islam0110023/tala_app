import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tala_app/core/model/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<Unit> saveUserInFireStore(UserModel user);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  @override
  Future<Unit> saveUserInFireStore(UserModel user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(user.toMap());
    return unit;
  }
}
