import 'package:dartz/dartz.dart';
import 'package:tala_app/core/errors/failure.dart';
import 'package:tala_app/feature/chat/data/data_source/chats_remote_data_source.dart';
import 'package:tala_app/feature/chat/domain/entities/chats_entity.dart';
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
}
