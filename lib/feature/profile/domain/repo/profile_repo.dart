import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/model/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Unit>> saveUserInFireStore(UserModel user);
}
