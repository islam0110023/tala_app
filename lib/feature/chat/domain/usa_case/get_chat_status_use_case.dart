import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/entities/chat_status_entity.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class GetChatStatusUseCase {
  GetChatStatusUseCase(this.chatsRepo);
  final ChatsRepo chatsRepo;
  Stream<Either<Failure, ChatStatusEntity>> call(String uid) {
    return chatsRepo.getChatStatus(uid);
  }
}
