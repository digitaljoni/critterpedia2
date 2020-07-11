import 'package:critterpedia/services/app_state_local.dart';

class AppStateRepository {
  AppStateRepository({this.local});

  final AppStateLocal local;

  Future<bool> fetchIsDarkMode() async {
    return await local.fetchIsDarkMode();
  }

  void setIsDarkMode(bool value) {
    local.saveIsDarkMode(value);
  }

  Future<String> fetchCurrentLocale() async {
    return await local.fetchCurrentLocale();
  }

  void setCurrentLocale(String value) {
    local.saveCurrentLocale(value);
  }
}
