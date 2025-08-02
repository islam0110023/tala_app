import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';

abstract class DatingRepo {
  Future<Either<Failure, List<num>>> getUserVector(String uid);
  
}