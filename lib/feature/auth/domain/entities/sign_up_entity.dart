import 'package:firebase_auth/firebase_auth.dart';

class SignUpEntity {
  SignUpEntity({
    required this.credential,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  final UserCredential credential;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
}
