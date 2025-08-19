import 'package:chatview/chatview.dart';
import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/data/data_source/chats_remote_data_source.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/entities/check_entity.dart';
import 'package:tala_app/feature/chat/domain/params/mark_as_params.dart';
import 'package:tala_app/feature/chat/domain/params/send_message_param.dart';
import 'package:tala_app/feature/chat/domain/params/update_message_status_params.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';

class ChatsRepoImpl extends ChatsRepo {
  ChatsRepoImpl(this.chatsRemoteDataSource);
  final ChatsRemoteDataSource chatsRemoteDataSource;
  @override
  Stream<Either<Failure, List<ChatEntity>>> getChats(String uid) {
    try {
      final chats = chatsRemoteDataSource.getChats(uid);
      return chats.map((chats) => right(chats));
    } catch (e) {
      return Stream.value(left(AppFailure.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, CheckEntity>> checkConnection(String uid) async {
    try {
      final check = await chatsRemoteDataSource.checkConnection(uid);
      return right(check);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> notConnection(String chatId) async {
    try {
      await chatsRemoteDataSource.notConnection(chatId);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptConnection(String chatId) async {
    try {
      await chatsRemoteDataSource.acceptConnection(chatId);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(SendMessageParam param) async {
    try {
      await chatsRemoteDataSource.sendMessage(param);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Stream<Either<Failure, List<Message>>> getMessages(String chatId) {
    try {
      final messages = chatsRemoteDataSource.getMessages(chatId);
      return messages.map((messages) => right(messages));
    } catch (e) {
      return Stream.value(left(AppFailure.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateMessageStatus(
    UpdateMessageStatusParams param,
  ) async {
    try {
      await chatsRemoteDataSource.updateMessageStatus(param);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> markMessagesAsRead(MarkAsParams param) async {
    try {
      await chatsRemoteDataSource.markMessagesAsRead(param);
      return right(unit);
    } catch (e) {
      return left(AppFailure.fromException(e));
    }
  }
}
