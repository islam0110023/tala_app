import 'package:get_it/get_it.dart';
import 'package:tala_app/core/services/internet_services.dart';
import 'package:tala_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tala_app/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';
import 'package:tala_app/feature/auth/domain/usecases/get_user_complete_use_case.dart';
import 'package:tala_app/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:tala_app/feature/auth/domain/usecases/login_with_google_use_case.dart';
import 'package:tala_app/feature/auth/domain/usecases/register_use_case.dart';
import 'package:tala_app/feature/auth/domain/usecases/reset_password_use_case.dart';
import 'package:tala_app/feature/auth/domain/usecases/save_user_auth_use_case.dart';
import 'package:tala_app/feature/chat/data/data_source/chats_remote_data_source.dart';
import 'package:tala_app/feature/chat/data/repo/chats_repo_impl.dart';
import 'package:tala_app/feature/chat/domain/repo/chats_repo.dart';
import 'package:tala_app/feature/chat/domain/usa_case/accept_connection_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/check_connection_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_chats_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_messages_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/get_typing_status_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/mark_messages_as_read_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/not_connection_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/send_message_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/send_reaction_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/update_message_status_use_case.dart';
import 'package:tala_app/feature/chat/domain/usa_case/update_typing_state_use_case.dart';
import 'package:tala_app/feature/dating/data/data_source/dating_local_data_source.dart';
import 'package:tala_app/feature/dating/data/data_source/dating_remote_data_source.dart';
import 'package:tala_app/feature/dating/data/repo/dating_repo_impl.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';
import 'package:tala_app/feature/dating/domain/usa_case/get_match_user_use_case.dart';
import 'package:tala_app/feature/dating/domain/usa_case/get_today_scroll_count_usa_case.dart';
import 'package:tala_app/feature/dating/domain/usa_case/get_user_vector_use_case.dart';
import 'package:tala_app/feature/dating/domain/usa_case/request_connection_use_case.dart';
import 'package:tala_app/feature/dating/domain/usa_case/reset_scroll_if_new_day_use_case.dart';
import 'package:tala_app/feature/dating/domain/usa_case/save_scroll_use_case.dart';
import 'package:tala_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tala_app/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:tala_app/feature/profile/domain/repo/profile_repo.dart';
import 'package:tala_app/feature/profile/domain/usa_case/create_vector_with_a_i_use_case.dart';
import 'package:tala_app/feature/profile/domain/usa_case/save_user_usa_case.dart';
import 'package:tala_app/feature/profile/domain/usa_case/store_vector_in_pinecone_use_case.dart';

final getIt = GetIt.instance;
void setUpServices() {
  getIt.registerLazySingleton<InternetService>(() => InternetService());
  //data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<DatingRemoteDataSource>(
    () => DatingRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<DatingLocalDataSource>(
    () => DatingLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<ChatsRemoteDataSource>(
    () => ChatsRemoteDataSourceImpl(),
  );
  // Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()));
  getIt.registerLazySingleton<DatingRepo>(
    () => DatingRepoImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<ChatsRepo>(() => ChatsRepoImpl(getIt()));

  // UseCases
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveUserUsaCase(getIt()));
  getIt.registerLazySingleton(() => SaveUserAuthUseCase(getIt()));
  getIt.registerLazySingleton(() => ResetPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginWithGoogleUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUserCompleteUseCase(getIt()));
  getIt.registerLazySingleton(() => CreateVectorWithAIUseCase(getIt()));
  getIt.registerLazySingleton(() => StoreVectorInPineconeUseCase(getIt()));
  getIt.registerLazySingleton(() => GetUserVectorUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMatchUserUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveScrollUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTodayScrollCountUsaCase(getIt()));
  getIt.registerLazySingleton(() => ResetScrollIfNewDayUseCase(getIt()));
  getIt.registerLazySingleton(() => RequestConnectionUseCase(getIt()));
  getIt.registerLazySingleton(() => GetChatsUseCase(getIt()));
  getIt.registerLazySingleton(() => CheckConnectionUseCase(getIt()));
  getIt.registerLazySingleton(() => NotConnectionUseCase(getIt()));
  getIt.registerLazySingleton(() => AcceptConnectionUseCase(getIt()));
  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMessagesUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateMessageStatusUseCase(getIt()));
  getIt.registerLazySingleton(() => MarkMessagesAsReadUseCase(getIt()));
  getIt.registerLazySingleton(() => SendReactionUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateTypingStateUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTypingStatusUseCase(getIt()));
}
