import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpEntity> register(RegisterParam param);
  Future<LoginEntity> login(LoginParam param);
  Future<Unit> saveUser(UserModel user);
  Future<Unit> resetPassword(String email);
  Future<LoginEntity> loginWithGoogle();
  Future<bool> getUserComplete(String uid);
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

  @override
  Future<LoginEntity> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();
    if (googleUser == null) throw Exception(LocaleKeys.sign_in_canceled.tr());
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    return LoginEntity(credential: userCredential);
  }

  @override
  Future<bool> getUserComplete(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      final bool isComplete = data['isComplete'];
      return isComplete;
    }
    return false;
  }
}
