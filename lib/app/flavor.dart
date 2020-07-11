import 'package:critterpedia/app/app.dart';
import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/utils/enums/env_type.dart';
import 'package:flutter/material.dart';

class Flavor {
  Flavor() {
    _instance = this;
    _init();
  }

  EnvType envType = EnvType.PRODUCTION;

  static Flavor _instance;
  static Flavor get instance => _instance;

  bool get isDevelopment => envType == EnvType.DEVELOPMENT;
  bool get isStaging => envType == EnvType.STAGING;
  bool get isProduction => envType == EnvType.PRODUCTION;

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (envType == EnvType.DEVELOPMENT || envType == EnvType.STAGING) {
      // set Logging level to high
    }

    final application = Application();
    await application.init();
    runApp(App(application));
  }
}
