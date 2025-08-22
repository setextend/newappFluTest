import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    // Регистрируем сервисы которые понадобятся позже
    // getIt.registerLazySingleton(() => ApiService());
    // getIt.registerLazySingleton(() => DatabaseService());
    // getIt.registerLazySingleton(() => AnalyticsService());
  }
}
