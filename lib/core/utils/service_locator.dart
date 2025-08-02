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
import 'package:tala_app/feature/dating/data/data_source/dating_remote_data_source.dart';
import 'package:tala_app/feature/dating/data/repo/dating_repo_impl.dart';
import 'package:tala_app/feature/dating/domain/repo/dating_repo.dart';
import 'package:tala_app/feature/dating/domain/usa_case/get_user_vector_use_case.dart';
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
  // Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()));
  getIt.registerLazySingleton<DatingRepo>(() => DatingRepoImpl(getIt()));

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
}
