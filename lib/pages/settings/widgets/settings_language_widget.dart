import 'package:critterpedia/app/app_view_model.dart';
import 'package:critterpedia/utils/languages/languages.dart';
import 'package:critterpedia/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsLanguageWidget extends StatelessWidget {
  const SettingsLanguageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supportedLocales = S.delegate.supportedLocales;
    final appState = Provider.of<AppViewModel>(context).appState;

    final dropdownMenuItemList = supportedLocales
        .map(
          (Locale locale) => DropdownMenuItem<String>(
            child: Text(Languages.getDisplayLanguage('${locale.languageCode}')),
            value: '${locale.languageCode}',
          ),
        )
        .toList();

    return Container(
      child: DropdownButton(
          value: appState.currentLocale,
          items: dropdownMenuItemList,
          onChanged: (String value) {
            final appState = Provider.of<AppViewModel>(context, listen: false);
            appState.changeLocale('$value');
          }),
    );
  }
}
