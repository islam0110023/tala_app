import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/dating/domain/entity/user_data_entity.dart';

abstract class DatingRepo {
  Future<Either<Failure, UserDataEntity>> getUserVector(String uid);
  
}