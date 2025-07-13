import 'package:get_it/get_it.dart';
import 'package:tala_app/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:tala_app/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:tala_app/feature/auth/domain/repo/auth_repo.dart';
import 'package:tala_app/feature/auth/domain/usecases/log_in_usecase.dart';
import 'package:tala_app/feature/auth/domain/usecases/register_use_case.dart';

final getIt = GetIt.instance;
void setUpServices() {
  //data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  // Repo
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));

  // UseCases
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
}
