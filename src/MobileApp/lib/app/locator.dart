import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:servermanager/models/app_settings.dart';
import 'package:servermanager/services/config_service.dart';

final locator = GetIt.instance;

void initLocator() {
  //* Models
  locator.registerSingletonAsync<AppSettings>(() => ConfigService().readConfigAsync());

  //* Third Party Services
  locator.registerLazySingleton(() => NavigationService());
}
