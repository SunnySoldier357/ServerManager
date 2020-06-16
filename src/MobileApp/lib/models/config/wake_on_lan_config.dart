class WakeOnLanConfig {
  //* Private Properties
  int _port;

  String _ipAddress;
  String _macAddress;

  //* Public Properties
  int get port => _port;

  String get ipAddress => _ipAddress;
  String get macAddress => _macAddress;

  //* Constructors
  WakeOnLanConfig.fromJson(Map<String, dynamic> json) {
    _port = json["WAN Port"];

    _ipAddress = json["WAN IP Address"];
    _macAddress = json["MAC Address"];
  }
}
