import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tala_app/feature/profile/domain/params/pinecone_param.dart';
import 'package:tala_app/feature/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoImpl(this.profileRemoteDataSource);
  final ProfileRemoteDataSource profileRemoteDataSource;
  @override
  Future<Either<Failure, Unit>> saveUserInFireStore(UserModel user) async {
    try {
      await profileRemoteDataSource.saveUserInFireStore(user);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<double>>> createVectorWithAI(
    String prompt,
  ) async {
    try {
      final vector = await profileRemoteDataSource.createVectorWithAI(prompt);
      return right(vector);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> storeVectorInPinecone(
    PineconeParam param,
  ) async {
    try {
      await profileRemoteDataSource.storeVectorInPinecone(param);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }
}
