import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:tala_app/feature/home/domain/entities/user_entity.dart';
import 'package:tala_app/feature/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this.homeRemoteDataSource);
  final HomeRemoteDataSource homeRemoteDataSource;
  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final user = await homeRemoteDataSource.getUser();
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(AppFailure.fromException(e));
    }
  }
}
