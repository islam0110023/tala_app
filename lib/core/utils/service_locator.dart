import 'package:get_it/get_it.dart';
import 'package:tala_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tala_app/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';
import 'package:tala_app/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:tala_app/feature/auth/domain/usecases/register_use_case.dart';
import 'package:tala_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tala_app/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:tala_app/feature/profile/domain/repo/profile_repo.dart';
import 'package:tala_app/feature/profile/domain/usa_case/save_user_usa_case.dart';

final getIt = GetIt.instance;
void setUpServices() {
  //data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  // Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()));

  // UseCases
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveUserUsaCase(getIt()));
}
