// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:shared_preferences/shared_preferences.dart';

// ThemeProvider: Provider Class
class ThemeProvider with ChangeNotifier {
  // Normal & Private: Class Properties
  bool _isDarkTheme = false;

  // Final: Class Properties
  final Future<SharedPreferences> preference = SharedPreferences.getInstance();

  // Getter: Class Methods
  bool get getTheme => _isDarkTheme;

  // Setter: Class Methods
  set setTheme(bool value) {
    _isDarkTheme = value;
    changeTheme(value);
    notifyListeners();
  }

  // Actions: Class Methods
  Future<void> initTheme() async {
    final SharedPreferences _prefs = await preference;
    bool? _isDarkTheme = _prefs.getBool("themeData");

    if (_isDarkTheme != null) {
      setTheme = _isDarkTheme;
    } else {
      setTheme = false;
    }
  }

  // Future: Class Methods
  // Future: Class Methods
  Future<void> changeTheme(bool value) async {
    final SharedPreferences _prefs = await preference;
    _prefs.setBool("themeData", value);
  }
}
