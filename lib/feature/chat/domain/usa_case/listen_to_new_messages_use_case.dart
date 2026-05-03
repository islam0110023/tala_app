import 'package:chatview/chatview.dart';
import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class ListenToNewMessagesUseCase {
  ListenToNewMessagesUseCase(this.chatsRepo);
  final ChatsRepo chatsRepo;
  Stream<Either<Failure, List<Message>>> call(String chatId) {
    return chatsRepo.listenToNewMessages(chatId);
  }
}
