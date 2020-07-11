import 'package:critterpedia/data/repositories/app_state_repository.dart';
import 'package:critterpedia/generated/l10n.dart';
import 'package:critterpedia/models/app_state.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppViewModel extends ChangeNotifier {
  AppViewModel({
    this.repository,
  }) {
    _init();
  }

  final AppStateRepository repository;
  AppState appState;

  Future<void> _init() async {
    // get brightness mode
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    final isDefaultDarkMode = brightness == Brightness.dark;

    // initialize appState
    appState = AppState(isDefaultDarkMode, 'en');

    final isDarkMode = await repository.fetchIsDarkMode();
    final currentLocale = await repository.fetchCurrentLocale();

    appState = appState.copyWith(
      isDarkMode: isDarkMode,
      currentLocale: currentLocale,
    );
    reloadLocale();
  }

  void updateThemeMode(bool isDarkMode) {
    appState = appState.copyWith(isDarkMode: isDarkMode);
    repository.setIsDarkMode(isDarkMode);
    notifyListeners();
    Log.info('Theme switched to ${isDarkMode ? 'Dark Theme' : 'Light Theme'}');
  }

  void changeLocale(String localeString) {
    if (appState.currentLocale == localeString) {
      return;
    }
    appState = appState.copyWith(currentLocale: localeString);
    repository.setCurrentLocale(localeString);
    reloadLocale();
  }

  void reloadLocale() {
    if (appState.currentLocale != null) {
      S.load(Locale(appState.currentLocale));
      notifyListeners();
      Log.info('Locale reloaded ${appState.currentLocale}');
    }
  }
}
