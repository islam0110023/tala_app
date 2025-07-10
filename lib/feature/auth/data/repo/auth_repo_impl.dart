import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this.authRemoteDataSource);

  final AuthRemoteDataSource authRemoteDataSource;
  late final SignUpEntity signUpEntity;
  @override
  Future<Either<Failure, SignUpEntity>> register(RegisterParam param) async {
    try {
      signUpEntity = await authRemoteDataSource.register(param);
      return right(signUpEntity);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

}
