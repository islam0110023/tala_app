import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/auth/domain/entities/log_in_entity.dart';
import 'package:tala_app/feature/auth/domain/params/login_param.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';

class LoginUseCase extends UseCase<LoginEntity, LoginParam> {
  LoginUseCase(this.authRepo);

  final AuthRepo authRepo;
  @override
  Future<Either<Failure, LoginEntity>> call([LoginParam? param]) {
    return authRepo.login(param!);
  }
}
