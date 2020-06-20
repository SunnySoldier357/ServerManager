import "dart:io";

import 'package:servermanager/app/locator.dart';
import 'package:servermanager/models/config/app_settings.dart';

class WakeOnLanService {
  //* Private Properties
  AppSettings _appSettings;

  //* Public Methods
  Future<void> sendPacketAsync() async {
    //* Make sure that AppSettings has been initialised
    await locator.isReady<AppSettings>();

    if (_appSettings == null) {
      _appSettings = locator<AppSettings>();
    }

    var socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
    socket.broadcastEnabled = true;

    var ipAddress = InternetAddress(
      _appSettings.wolConfig.ipAddress,
      type: InternetAddressType.IPv4,
    );

    socket.send(
      _createMagicPacket(_appSettings.wolConfig.macAddress),
      ipAddress,
      _appSettings.wolConfig.port,
    );
  }

  //* Private Methods
  List<int> _createMagicPacket(String fullMacAddress) {
    // Remove any semicolons or minus characters present in the MAC address
    String macAddress = fullMacAddress.replaceAll(new RegExp("[-|:]"), "");

    // https://www.fluxbytes.com/csharp/wake-lan-wol-c/

    int payloadIndex = 0;

    // The magic packet is a broadcast frame containing anywhere within its
    // payload 6 bytes of all 255 (FF FF FF FF FF FF in hexadecimal), followed
    // by sixteen repetitions of the target computer's 48-bit MAC address, for a
    // total of 102 bytes.
    List<int> payload = List<int>(102);

    // Add 6 bytes with value 255 (FF) to the payload
    for (int i = 0; i < 6; i++) {
      payload[payloadIndex] = 255;
      payloadIndex++;
    }

    // Repeat the device MAC address sixteen times
    for (int i = 0; i < 16; i++) {
      for (int j = 0; j < macAddress.length; j += 2) {
        String sub = macAddress.substring(j, j + 2);
        payload[payloadIndex] = int.parse(sub, radix: 16);
        payloadIndex++;
      }
    }

    return payload;
  }
}
