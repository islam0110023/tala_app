import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/home/domain/entities/user_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserEntity>> getUser();
}
