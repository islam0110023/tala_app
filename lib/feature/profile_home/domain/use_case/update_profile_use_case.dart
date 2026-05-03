import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/profile_home/domain/repo/profile_home_repo.dart';

class UpdateProfileUseCase {
  UpdateProfileUseCase(this.profileHomeRepo);
  final ProfileHomeRepo profileHomeRepo;
  Future<Either<Failure, Unit>> call(Map<String, dynamic> data) async {
    return await profileHomeRepo.updateProfile(data);
  }
}
