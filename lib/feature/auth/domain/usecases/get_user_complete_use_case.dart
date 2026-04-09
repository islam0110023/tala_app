import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';

class GetUserCompleteUseCase extends UseCase<bool, String> {
  GetUserCompleteUseCase(this.authRepo);
  final AuthRepo authRepo;

  @override
  Future<Either<Failure, bool>> call([String? uid]) {
    return authRepo.getUserComplete(uid!);
  }
}
