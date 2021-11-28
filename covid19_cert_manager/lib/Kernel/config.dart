import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static AppConfig? config = null;
  late SharedPreferences sharedPreferences;

  static Future<AppConfig> getInstance() async {
    if(config == null) {
      config = AppConfig();
      config!.sharedPreferences = await SharedPreferences.getInstance();
    }
    return config!;
  }

  AppConfig() {}

  bool hasBiometricProtection() {
    return sharedPreferences.getBool("hasBiometricProtection") ?? false;
  }

  void setBiometricProtection(bool enabled) {
    sharedPreferences.setBool("hasBiometricProtection", enabled);
  }

  bool enabledDarkMode() {
    return sharedPreferences.getBool("darkModeEnabled") ?? false;
  }

  void setDarkMode(bool enabled) {
    sharedPreferences.setBool("darkModeEnabled", enabled);
  }
}