import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/domain/params/match_user_params.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class GetMatchUserUseCase
    extends UseCase<List<MatchUserEntity>, MatchUserParams> {
  GetMatchUserUseCase(this.repo);

  final DatingRepo repo;
  @override
  Future<Either<Failure, List<MatchUserEntity>>> call([
    MatchUserParams? param,
  ]) {
    return repo.getMatchesUser(param!);
  }
}
