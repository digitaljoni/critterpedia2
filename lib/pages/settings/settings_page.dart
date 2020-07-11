import 'package:critterpedia/app/app_view_model.dart';
import 'package:critterpedia/app/flavor.dart';
import 'package:critterpedia/pages/settings/widgets/settings_language_widget.dart';
import 'package:critterpedia/utils/enums/env_type.dart';
import 'package:critterpedia/generated/l10n.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  static const routeName = '/settings';
  static var routeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SettingsPage();
  });

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppViewModel>(context).appState;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(S.of(context).settingsDarkMode),
            trailing: Switch(
              value: appState.isDarkMode,
              onChanged: (bool isDarkMode) {
                Provider.of<AppViewModel>(context, listen: false)
                    .updateThemeMode(isDarkMode);
              },
            ),
          ),
          ListTile(
            title: Text(S.of(context).settingsLanguage),
            trailing: SettingsLanguageWidget(),
          ),
          (Flavor.instance.envType == EnvType.PRODUCTION)
              ? SizedBox()
              : ListTile(
                  title: Text(S.of(context).settingsEnvironment),
                  trailing: Text(
                    '${Flavor.instance.envType.toShortString()}',
                  ),
                ),
        ],
      ),
    );
  }
}
