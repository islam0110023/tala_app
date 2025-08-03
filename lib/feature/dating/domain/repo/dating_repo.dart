import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/dating/domain/entity/match_user_entity.dart';
import 'package:tala_app/feature/dating/domain/entity/user_data_entity.dart';
import 'package:tala_app/feature/dating/domain/params/match_user_params.dart';

abstract class DatingRepo {
  Future<Either<Failure, UserDataEntity>> getUserVector(String uid);
  Future<Either<Failure, List<MatchUserEntity>>> getMatchesUser(
    MatchUserParams params,
  );
}
