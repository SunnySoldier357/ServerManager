class AppSettings {
  //* Private Properties
  String _testString;

  //* Public Properties
  String get testString => _testString;

  //* Constructors
  AppSettings.fromJson(Map<String, dynamic> json) {
    _testString = json["testString"];
  }
}
