import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:servermanager/models/config/app_settings.dart';
import 'package:servermanager/services/config_service.dart';
import 'package:servermanager/services/wake_on_lan_service.dart';

final locator = GetIt.instance;

void initLocator() {
  //* Models
  locator.registerLazySingletonAsync<AppSettings>(
    () => ConfigService().readConfigAsync(),
  );

  //* Services
  locator.registerLazySingleton(() => WakeOnLanService());

  //* Third Party Services
  locator.registerLazySingleton(() => NavigationService());
}
