import 'package:chatview/chatview.dart';
import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/entities/check_entity.dart';
import 'package:tala_app/feature/chat/domain/params/send_message_param.dart';
import 'package:tala_app/feature/chat/domain/params/update_message_status_params.dart';

abstract class ChatsRepo {
  Stream<Either<Failure, List<ChatEntity>>> getChats(String uid);
  Future<Either<Failure, CheckEntity>> checkConnection(String uid);
  Future<Either<Failure, Unit>> notConnection(String chatId);
  Future<Either<Failure, Unit>> acceptConnection(String chatId);
  Future<Either<Failure, Unit>> sendMessage(SendMessageParam param);
  Stream<Either<Failure, List<Message>>> getMessages(String chatId);
  Future<Either<Failure, Unit>> updateMessageStatus(
    UpdateMessageStatusParams param,
  );
}
