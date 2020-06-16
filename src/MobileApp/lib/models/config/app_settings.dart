import 'package:servermanager/models/config/wake_on_lan_config.dart';

class AppSettings {
  //* Private Properties
  WakeOnLanConfig _wolConfig;

  //* Public Properties
  WakeOnLanConfig get wolConfig => _wolConfig;

  //* Constructors
  AppSettings.fromJson(Map<String, dynamic> json) {
    _wolConfig = WakeOnLanConfig.fromJson(json["WakeOnLan"]);
  }
}
