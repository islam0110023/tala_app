import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/params/mark_as_params.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class MarkMessagesAsReadUseCase extends UseCase<Unit, MarkAsParams> {
  MarkMessagesAsReadUseCase(this.repo);
  final ChatsRepo repo;
  @override
  Future<Either<Failure, Unit>> call([MarkAsParams? param]) {
    return repo.markMessagesAsRead(param!);
  }
}
