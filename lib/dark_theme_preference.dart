// Flutter: External Libraries
import 'package:shared_preferences/shared_preferences.dart';

// DarkThemePreference: Theme Management Class
class DarkThemePreference {
  // Static & Constant: Class Properties
  static const themeStatus = "THEMESTATUS";

  // Action: Class Methods
  setDarkTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themeStatus) ?? false;
  }
}
