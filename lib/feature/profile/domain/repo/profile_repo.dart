import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/profile/domain/params/pinecone_param.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Unit>> saveUserInFireStore(UserModel user);
  Future<Either<Failure, List<double>>> createVectorWithAI(String prompt);
  Future<Either<Failure, Unit>> storeVectorInPinecone(PineconeParam param);
}
