import 'package:stacked/stacked.dart';

import 'package:servermanager/app/locator.dart';
import 'package:servermanager/services/wake_on_lan_service.dart';

class PowerViewModel extends BaseViewModel {
  //* Private Properties
  final WakeOnLanService _wolService = locator<WakeOnLanService>();

  //* Public Methods
  Future<void> turnOnServerAsync() async => await _wolService.sendPacketAsync();
}
