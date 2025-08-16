import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/params/send_message_param.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class SendMessageUseCase extends UseCase<Unit, SendMessageParam> {
  SendMessageUseCase(this.repo);
  final ChatsRepo repo;
  @override
  Future<Either<Failure, Unit>> call([SendMessageParam? param]) {
    return repo.sendMessage(param!);
  }
}
