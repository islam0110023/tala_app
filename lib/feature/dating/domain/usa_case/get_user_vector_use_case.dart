import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class GetUserVectorUseCase extends UseCase<List<num>, String> {
  GetUserVectorUseCase(this.repo);

  final DatingRepo repo;
  @override
  Future<Either<Failure, List<num>>> call([String? uid]) {
    return repo.getUserVector(uid!);
  }
}
