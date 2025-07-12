import 'package:firebase_auth/firebase_auth.dart';

class LoginEntity {
  LoginEntity({required this.credential});

  final UserCredential credential;
}