import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/profile/domain/repo/profile_repo.dart';

class CreateVectorWithAIUseCase extends UseCase<List<double>, String> {
  CreateVectorWithAIUseCase(this.profileRepo);
  final ProfileRepo profileRepo;
  @override
  Future<Either<Failure, List<double>>> call([String? prompt]) {
    return profileRepo.createVectorWithAI(prompt!);
  }
}
