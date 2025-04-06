import 'package:get_it/get_it.dart';
import '../../data/datasources/query_api_client.dart';
import '../../data/repositories/query_repository.dart';
import '../../domain/use_cases/query_use_case.dart';
import '../../presentation/providers/query_provider.dart';
import 'app_config.dart';

final instance = GetIt.instance;

void setupDependencies() {
  // Data Layer
  instance.registerLazySingleton(
    () => QueryApiClient(baseUrl: AppConfig.serverUrl),
  );
  instance.registerLazySingleton(
    () => QueryRepository(apiClient: instance<QueryApiClient>()),
  );

  // Domain Layer
  instance.registerLazySingleton(
    () => QueryUseCase(repository: instance<QueryRepository>()),
  );

  // Presentation Layer
  // Registro del QueryProvider para ser utilizado por Provider en la UI.
  instance.registerFactory(
    () => QueryProvider(queryUseCase: instance<QueryUseCase>()),
  );
}
