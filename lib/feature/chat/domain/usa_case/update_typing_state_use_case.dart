import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/params/update_typing_state_param.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class UpdateTypingStateUseCase extends UseCase<Unit, UpdateTypingStateParam> {
  UpdateTypingStateUseCase(this.chatsRepo);

  final ChatsRepo chatsRepo;
  @override
  Future<Either<Failure, Unit>> call([UpdateTypingStateParam? param]) {
    return chatsRepo.updateTypingStatus(param!);
  }
}
