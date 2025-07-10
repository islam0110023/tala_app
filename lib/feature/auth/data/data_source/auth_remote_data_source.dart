import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpEntity> register(RegisterParam param);
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
}
