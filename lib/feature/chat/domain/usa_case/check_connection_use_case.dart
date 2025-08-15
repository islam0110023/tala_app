import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/entities/check_entity.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class CheckConnectionUseCase extends UseCase<CheckEntity, String> {
  CheckConnectionUseCase(this.chatsRepo);

  final ChatsRepo chatsRepo;
  @override
  Future<Either<Failure, CheckEntity>> call([String? param]) {
    return chatsRepo.checkConnection(param!);
  }
}
