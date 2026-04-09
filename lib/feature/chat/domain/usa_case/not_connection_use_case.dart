import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class NotConnectionUseCase extends UseCase<Unit, String> {
  NotConnectionUseCase(this.repo);
  final ChatsRepo repo;
  @override
  Future<Either<Failure, Unit>> call([String? param]) {
    return repo.notConnection(param!);
  }
}
