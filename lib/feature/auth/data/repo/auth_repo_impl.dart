import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this.authRemoteDataSource);

  final AuthRemoteDataSource authRemoteDataSource;
  late final SignUpEntity signUpEntity;
  late final LoginEntity loginEntity;
  @override
  Future<Either<Failure, SignUpEntity>> register(RegisterParam param) async {
    try {
      signUpEntity = await authRemoteDataSource.register(param);
      return right(signUpEntity);
    } on FirebaseAuthException catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParam param) async {
    try {
      final loginEntity = await authRemoteDataSource.login(param);
      return right(loginEntity);
    } on FirebaseAuthException catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveUser(UserModel user) async {
    try {
      await authRemoteDataSource.saveUser(user);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AppFailure.fromException(e));
    }
  }
}
