import 'dart:async';

import 'package:critterpedia/app/app_view_model.dart';
import 'package:critterpedia/app/application.dart';
import 'package:critterpedia/generated/l10n.dart';
import 'package:critterpedia/models/filter/filter_view_model.dart';
import 'package:critterpedia/models/fish/fishes_view_model.dart';
import 'package:critterpedia/models/insect/insects_view_model.dart';
import 'package:critterpedia/models/sea_creature/sea_creatures_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  App(this.application, {Key key}) : super(key: key);

  final Application application;

  @override
  _AppState createState() => _AppState(application);
}

class _AppState extends State<App> {
  _AppState(this._application);

  final Application _application;

  Timer timer;

  AppViewModel _appViewModel;
  FishesViewModel _fishesViewModel;
  InsectsViewModel _insectsViewModel;
  SeaCreaturesViewModel _seaCreaturesViewModel;

  FilterViewModel _filterViewModel;

  @override
  void initState() {
    super.initState();

    // initialize appState
    _appViewModel = AppViewModel(
      repository: _application.appStateRepository,
    );

    _fishesViewModel =
        FishesViewModel(repository: _application.crittersRepository);

    _insectsViewModel =
        InsectsViewModel(repository: _application.crittersRepository);

    _seaCreaturesViewModel =
        SeaCreaturesViewModel(repository: _application.crittersRepository);

    _filterViewModel = FilterViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Application>.value(value: _application),
        ChangeNotifierProvider<AppViewModel>.value(value: _appViewModel),
        ChangeNotifierProvider<FilterViewModel>.value(value: _filterViewModel),
        ChangeNotifierProvider<FishesViewModel>.value(value: _fishesViewModel),
        ChangeNotifierProvider<InsectsViewModel>.value(
            value: _insectsViewModel),
        ChangeNotifierProvider<SeaCreaturesViewModel>.value(
            value: _seaCreaturesViewModel),
      ],
      child: _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  _MaterialApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _application = Provider.of<Application>(context, listen: false);
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, _) {
        final appState = appViewModel.appState;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateTitle: (context) => S.of(context).appTitle,
          darkTheme: _application.theme.dark,
          theme: _application.theme.light,
          themeMode: (appState.isDarkMode) ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: _application.router.generator,
        );
      },
    );
  }
}
