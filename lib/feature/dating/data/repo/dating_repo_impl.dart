import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/dating/data/data_source/dating_remote_data_source.dart';
import 'package:tala_app/feature/dating/domain/entity/user_data_entity.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class DatingRepoImpl extends DatingRepo {
  DatingRepoImpl(this.datingRemoteDataSource);
  final DatingRemoteDataSource datingRemoteDataSource;

  @override
  Future<Either<Failure, UserDataEntity>> getUserVector(String uid) async {
    try {
      final vector = await datingRemoteDataSource.getUserVector(uid);
      return right(vector);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }
}
