import 'package:chatview/chatview.dart';
import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class GetMessagesUseCase extends UseCaseStream<List<Message>, String> {
  GetMessagesUseCase(this.repo);
  final ChatsRepo repo;
  @override
  Stream<Either<Failure, List<Message>>> call([String? param]) {
    return repo.getMessages(param!);
  }
}
