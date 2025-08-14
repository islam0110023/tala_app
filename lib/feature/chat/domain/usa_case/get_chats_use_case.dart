import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/core/usecase/usecase.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class GetChatsUseCase extends UseCaseStream<List<ChatEntity>, String> {
  GetChatsUseCase(this.repo);

  final ChatsRepo repo;
  @override
  Stream<Either<Failure, List<ChatEntity>>> call([String? uid]) {
    return repo.getChats(uid!);
  }
}
