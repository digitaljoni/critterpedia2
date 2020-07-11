import 'package:shared_preferences/shared_preferences.dart';

class AppStateLocal {
  AppStateLocal({this.prefs});

  SharedPreferences prefs;

  final keyIsDarkMode = 'is_dark_mode';
  final keyCurrentLocale = 'current_locale';

  Future<bool> fetchIsDarkMode() async {
    return await prefs.getBool(keyIsDarkMode);
  }

  void saveIsDarkMode(bool value) {
    prefs.setBool(keyIsDarkMode, value);
  }

  Future<String> fetchCurrentLocale() async {
    return await prefs.getString(keyCurrentLocale);
  }

  void saveCurrentLocale(String value) {
    prefs.setString(keyCurrentLocale, value);
  }
}
