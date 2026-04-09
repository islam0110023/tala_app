import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:tala_app/feature/auth/domain/params/register_param.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';

class RegisterUseCase extends UseCase<SignUpEntity, RegisterParam> {
  RegisterUseCase(this.authRepo);

  final AuthRepo authRepo;
  @override
  Future<Either<Failure, SignUpEntity>> call([RegisterParam? param]) {
    return authRepo.register(param!);
  }
}
