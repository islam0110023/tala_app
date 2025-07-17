import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpEntity> register(RegisterParam param);
  Future<LoginEntity> login(LoginParam param);
  Future<Unit> saveUser(UserModel user);
  Future<Unit> resetPassword(String email);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<SignUpEntity> register(RegisterParam param) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: param.email,
          password: param.password,
        );
    return SignUpEntity(
      credential: credential,
      firstName: param.firstName,
      lastName: param.lastName,
      email: param.email,
      phone: param.phoneNum,
    );
  }

  @override
  Future<LoginEntity> login(LoginParam param) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: param.email,
      password: param.password,
    );
    return LoginEntity(credential: credential);
  }

  @override
  Future<Unit> saveUser(UserModel user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(user.toFirstMap(), SetOptions(merge: true));
    return unit;
  }

  @override
  Future<Unit> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return unit;
  }
}
