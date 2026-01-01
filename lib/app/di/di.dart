import 'package:gamezone_flutter/features/auth/domain/repository/auth_local_repository.dart';
import 'package:gamezone_flutter/features/auth/domain/use_case/register_user_use_case.dart';
import 'package:get_it/get_it.dart';
import '../../core/service/hive_service.dart';
import '../../features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:gamezone_flutter/features/auth/domain/use_case/login_use_case.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  // 1. Core Services
  locator.registerLazySingleton<HiveService>(() => HiveService());

  // 2. Data Sources
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(locator<HiveService>()),
  );

  // 3. Repositories
  locator.registerLazySingleton<AuthLocalRepository>(
    () => AuthLocalRepository(locator<AuthLocalDataSource>()),
  );

  // 4. Use Cases
  locator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(repository: locator<AuthLocalRepository>()),
  );
  
  locator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(repository: locator<AuthLocalRepository>()),
  );
}