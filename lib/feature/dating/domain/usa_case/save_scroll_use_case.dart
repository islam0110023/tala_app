import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class SaveScrollUseCase extends UseCase<Unit,int> {
  SaveScrollUseCase(this.repo);

  final DatingRepo repo;
  @override
  Future<Either<Failure, Unit>> call([int? param]) {
    return repo.saveScroll(param!);
  }
}