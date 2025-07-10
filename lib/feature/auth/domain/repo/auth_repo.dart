import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignUpEntity>> register(RegisterParam param);
}
