import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class MarkNotificationAsReadUseCase {
  MarkNotificationAsReadUseCase(this.chatsRepo);

  final ChatsRepo chatsRepo;
  Future<Either<Failure, Unit>> call(String chatId) {
    return chatsRepo.markNotificationAsRead(chatId);
  }
}
