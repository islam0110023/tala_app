import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';

class SaveUserAuthUseCase extends UseCase<Unit, UserModel> {
  SaveUserAuthUseCase(this.authRepo);

  final AuthRepo authRepo;
  @override
  Future<Either<Failure, Unit>> call([UserModel? user]) {
    return authRepo.saveUser(user!);
  }
}
