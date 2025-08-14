import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/dating/domain/params/request_params.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';

class RequestConnectionUseCase extends UseCase<Unit, RequestParams> {
  RequestConnectionUseCase(this.datingRepo);

  final DatingRepo datingRepo;
  @override
  Future<Either<Failure, Unit>> call([RequestParams? uid]) {
    return datingRepo.requestConnection(uid!);
  }
}
