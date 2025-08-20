import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/params/update_typing_state_param.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class GetTypingStatusUseCase
    extends UseCaseStream<bool, UpdateTypingStateParam> {
  GetTypingStatusUseCase(this.repo);
  final ChatsRepo repo;

  @override
  Stream<Either<Failure, bool>> call([UpdateTypingStateParam? param]) {
    return repo.getTypingStatus(param!);
  }
}
