import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/profile_home/data/data_source/profile_home_remote_data_source.dart';
import 'package:tala_app/feature/profile_home/data/model/privacy_policy_model.dart';
import 'package:tala_app/feature/profile_home/domain/repo/profile_home_repo.dart';

class ProfileHomeRepoImpl extends ProfileHomeRepo {
  ProfileHomeRepoImpl(this.remoteDataSource);
  final ProfileHomeRemoteDataSource remoteDataSource;
  @override
  Future<Either<Failure, PrivacyPolicyModel>> getPrivacyPolicy() async {
    try {
      final data = await remoteDataSource.getPrivacyPolicy();
      return Right(data);
    } catch (e) {
      return Left(AppFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PrivacyPolicyModel>> getTermsConditions() async {
    try {
      final data = await remoteDataSource.getTermsConditions();
      return Right(data);
    } catch (e) {
      return Left(AppFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProfile(Map<String, dynamic> data) async {
    try {
      await remoteDataSource.updateProfile(data);
      return const Right(unit);
    } catch (e) {
      return Left(AppFailure.fromException(e.toString()));
    }
  }
}
