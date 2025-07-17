import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignUpEntity>> register(RegisterParam param);
  Future<Either<Failure, LoginEntity>> login(LoginParam param);
  Future<Either<Failure, Unit>> saveUser(UserModel user);
  Future<Either<Failure, Unit>> resetPassword(String email);
}
