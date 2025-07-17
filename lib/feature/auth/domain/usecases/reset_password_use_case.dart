import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';

class ResetPasswordUseCase extends UseCase<Unit, String> {
  ResetPasswordUseCase(this.repo);
  final AuthRepo repo;
  @override
  Future<Either<Failure, Unit>> call([String? email]) {
    return repo.resetPassword(email!);
  }
}
