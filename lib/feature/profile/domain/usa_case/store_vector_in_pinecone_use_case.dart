import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/profile/domain/params/pinecone_param.dart';
import 'package:tala_app/feature/profile/domain/repo/profile_repo.dart';

class StoreVectorInPineconeUseCase extends UseCase<Unit, PineconeParam> {
  StoreVectorInPineconeUseCase(this.repo);
  final ProfileRepo repo;
  @override
  Future<Either<Failure, Unit>> call([PineconeParam? param]) {
    return repo.storeVectorInPinecone(param!);
  }
}
