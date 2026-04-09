import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

abstract class UseCaseStream<Type, Param> {
  Stream<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
