import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class GetMessagesPageUseCase {
  GetMessagesPageUseCase(this.chatsRepo);
  final ChatsRepo chatsRepo;
  Future<Either<Failure, (List<Message>, DocumentSnapshot?)>> call({
    required String chatId,
    DocumentSnapshot? lastDoc,
    int? limit ,
  }) {
    return chatsRepo.getMessagesPage(
      chatId: chatId,
      lastDoc: lastDoc,
      limit: limit,
    );
  }
}
