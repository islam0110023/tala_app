import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class RequestConnectionUseCase extends UseCase<Unit, String> {
  RequestConnectionUseCase(this.datingRepo);

  final DatingRepo datingRepo;
  @override
  Future<Either<Failure, Unit>> call([String? uid]) {
    return datingRepo.requestConnection(uid!);
  }
}
