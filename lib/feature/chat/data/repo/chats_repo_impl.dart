import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/data/data_source/chats_remote_data_source.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
import 'package:tala_app/feature/chat/domain/entities/check_entity.dart';
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
}
