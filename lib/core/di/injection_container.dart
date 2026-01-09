import 'package:get_it/get_it.dart';
import '../../features/status/data/datasources/status_local_data_source.dart';
import '../../features/status/data/repositories/status_repository_impl.dart';
import '../../features/status/domain/repositories/status_repository.dart';
import '../../features/status/domain/usecases/get_statuses.dart';
import '../../features/status/domain/usecases/save_status.dart';
import '../../features/status/presentation/bloc/status_bloc.dart';



final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  
  // Features - Status
  // Bloc
  getIt.registerFactory(
    () => StatusBloc(getStatuses: getIt(), saveStatus: getIt()),
  );

  // UseCases
  getIt.registerLazySingleton(() => GetStatuses(getIt()));
  getIt.registerLazySingleton(() => SaveStatus(getIt()));

  // Repositories
  getIt.registerLazySingleton<StatusRepository>(
    () => StatusRepositoryImpl(getIt()),
  );

  // DataSources
  getIt.registerLazySingleton<StatusLocalDataSource>(
    () => StatusLocalDataSourceImpl(),
  );
}
