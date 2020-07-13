# critterpedia

Critterpedia is an interactive companion for the ACNH players. It helps you discover new critters in your island by showing you what critters are available during the current month and current hour.


## Translations

The critter names are available, however, the UI elements need to be translated.

This project uses [Flutter Intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) to handle managing the translations. It automatically generates code from the .arb files that are located in the ```/lib/l10n/``` directory.

Don't forget to update ```ios/Runner/Info.plist``` when adding a new locale.

