import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';

abstract class ChatsRepo {
  Stream<Either<Failure, List<ChatEntity>>> getChats(String uid);
}
