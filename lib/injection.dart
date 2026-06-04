import 'package:get_it/get_it.dart';
import 'package:haya/core/networking/api_service.dart';
import 'package:haya/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:haya/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:haya/features/auth/data/repositories/auth_repo.dart';
import 'package:haya/features/auth/presentation/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());




  //Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(apiService: getIt()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(authLocalDataSource: getIt(), remoteDataSource: getIt()),
  );
  getIt.registerFactory(() => AuthCubit(authRepo: getIt()));



  
}
