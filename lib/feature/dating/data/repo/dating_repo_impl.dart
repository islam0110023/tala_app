import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/dating/data/data_source/dating_local_data_source.dart';
import 'package:tala_app/feature/dating/data/data_source/dating_remote_data_source.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/domain/entity/user_data_entity.dart';
import 'package:tala_app/feature/dating/domain/params/match_user_params.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class DatingRepoImpl extends DatingRepo {
  DatingRepoImpl(this.datingRemoteDataSource, this.datingLocalDataSource);
  final DatingRemoteDataSource datingRemoteDataSource;
  final DatingLocalDataSource datingLocalDataSource;

  @override
  Future<Either<Failure, UserDataEntity>> getUserVector(String uid) async {
    try {
      final vector = await datingRemoteDataSource.getUserVector(uid);
      return right(vector);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MatchUserEntity>>> getMatchesUser(
    MatchUserParams params,
  ) async {
    try {
      final matches = await datingRemoteDataSource.getMatchesUser(params);
      return right(matches);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveScroll(int scrollAmount) async {
    try {
      await datingLocalDataSource.saveScroll(scrollAmount);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, int>> getTodayScrollCount() async {
    try {
      final count = await datingLocalDataSource.getTodayScrollCount();
      return right(count);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetScrollIfNewDay() async {
    try {
      await datingLocalDataSource.resetScrollIfNewDay();
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> requestConnection(String uid) async {
    try {
      await datingRemoteDataSource.requestConnection(uid);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }
}
