import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/home/domain/entities/user_entity.dart';
import 'package:tala_app/feature/home/domain/repo/home_repo.dart';

class GetUserUseCase {
  GetUserUseCase(this.homeRepo);
  final HomeRepo homeRepo;
  Future<Either<Failure, UserEntity>> call() async {
    return await homeRepo.getUser();
  }
}
