import 'package:critterpedia/config/styles/custom_theme.dart';
import 'package:critterpedia/repositories/app_state_repository.dart';
import 'package:critterpedia/services/app_state_local.dart';

import 'package:critterpedia/app/flavor.dart';
import 'package:critterpedia/app/routes.dart';
import 'package:critterpedia/utils/enums/env_type.dart';
import 'package:critterpedia/utils/log/log.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  AppTheme _theme;
  Router _router;
  SharedPreferences _prefs;

  AppTheme get theme => _theme;
  Router get router => _router;
  SharedPreferences get preferences => _prefs;

  AppStateRepository appStateRepository;

  Future<void> init() async {
    _initTheme();
    _initLogging();
    _initRouter();
    await _initSharedPrefs();
    _initRepository();
    // init db services (Sqflite)
    // init api services
    // init repositories
  }

  void dispose() {
    // add any close/dispose
  }

  void _initTheme() {
    // initialize theme based on files in config/theme
    _theme = AppTheme(
      light: customTheme,
      dark: customTheme,
    );
  }

  void _initLogging() {
    // initialize logging
    Log.init();
    if (Flavor.instance.envType == EnvType.PRODUCTION) {
      Log.setLevel(Level.INFO);
      return;
    }
    Log.setLevel(Level.ALL);
  }

  void _initRouter() {
    // initialize router and routes
    _router = Router();
    Routes.configureRoutes(_router);
  }

  Future<void> _initSharedPrefs() async {
    // initialize shared preferences
    _prefs = await SharedPreferences.getInstance();
  }

  void _initRepository() {
    appStateRepository = AppStateRepository(
      local: AppStateLocal(
        prefs: _prefs,
      ),
    );
  }
}

class AppTheme {
  AppTheme({
    @required this.light,
    @required this.dark,
  });
  final ThemeData light;
  final ThemeData dark;
}
