import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/profile_home/data/model/privacy_policy_model.dart';
import 'package:tala_app/feature/profile_home/domain/repo/profile_home_repo.dart';

class GetPrivacyPolicyUseCase {

  GetPrivacyPolicyUseCase(this.profileHomeRepo);
  final ProfileHomeRepo profileHomeRepo;

  Future<Either<Failure, PrivacyPolicyModel>> call() async {
    return await profileHomeRepo.getPrivacyPolicy();
  }
}
