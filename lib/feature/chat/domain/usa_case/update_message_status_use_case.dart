import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/params/update_message_status_params.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class UpdateMessageStatusUseCase
    extends UseCase<Unit, UpdateMessageStatusParams> {
  UpdateMessageStatusUseCase(this.chatsRepo);
  final ChatsRepo chatsRepo;
  @override
  Future<Either<Failure, Unit>> call([UpdateMessageStatusParams? param]) {
    return chatsRepo.updateMessageStatus(param!);
  }
}
