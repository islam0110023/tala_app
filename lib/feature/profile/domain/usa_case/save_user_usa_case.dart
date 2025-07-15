import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/model/user_model.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/profile/domain/repo/profile_repo.dart';

class SaveUserUsaCase extends UseCase<Unit, UserModel> {
  SaveUserUsaCase(this.repo);
  final ProfileRepo repo;
  @override
  Future<Either<Failure, Unit>> call([UserModel? user]) {
    return repo.saveUserInFireStore(user!);
  }
}
