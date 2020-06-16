import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:servermanager/models/config/app_settings.dart';

class ConfigService {
  //* Constants
  static const String _CONFIG_FILE = "assets/secrets/appsettings.json";

  //* Public Methods
  Future<AppSettings> readConfigAsync() async {
    var data = json.decode(await rootBundle.loadString(_CONFIG_FILE));

    return AppSettings.fromJson(data);
  }
}
