import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class GetTodayScrollCountUsaCase extends UseCase<int, NoParam> {
  GetTodayScrollCountUsaCase(this.repo);

  final DatingRepo repo;
  @override
  Future<Either<Failure, int>> call([NoParam? param]) {
    return repo.getTodayScrollCount();
  }
}
