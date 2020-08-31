// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S.current = S();
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Critterpedia`
  String get appTitle {
    return Intl.message(
      'Critterpedia',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get availabilityHoursTitle {
    return Intl.message(
      'Hours',
      name: 'availabilityHoursTitle',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get availabilityMonthsTitle {
    return Intl.message(
      'Months',
      name: 'availabilityMonthsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Availability ({hemisphere})`
  String availabilityTitle(Object hemisphere) {
    return Intl.message(
      'Availability ($hemisphere)',
      name: 'availabilityTitle',
      desc: '',
      args: [hemisphere],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Current Hour`
  String get currentHour {
    return Intl.message(
      'Current Hour',
      name: 'currentHour',
      desc: '',
      args: [],
    );
  }

  /// `Current Month`
  String get currentMonth {
    return Intl.message(
      'Current Month',
      name: 'currentMonth',
      desc: '',
      args: [],
    );
  }

  /// `Date/Time`
  String get dateTime {
    return Intl.message(
      'Date/Time',
      name: 'dateTime',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get fish {
    return Intl.message(
      'Fish',
      name: 'fish',
      desc: '',
      args: [],
    );
  }

  /// `Hemisphere`
  String get hemisphere {
    return Intl.message(
      'Hemisphere',
      name: 'hemisphere',
      desc: '',
      args: [],
    );
  }

  /// `Insects`
  String get insects {
    return Intl.message(
      'Insects',
      name: 'insects',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Location Tab`
  String get locationTab {
    return Intl.message(
      'Location Tab',
      name: 'locationTab',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get locationTitle {
    return Intl.message(
      'Location',
      name: 'locationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get main {
    return Intl.message(
      'Main',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Main Tab`
  String get mainTab {
    return Intl.message(
      'Main Tab',
      name: 'mainTab',
      desc: '',
      args: [],
    );
  }

  /// `North`
  String get north {
    return Intl.message(
      'North',
      name: 'north',
      desc: '',
      args: [],
    );
  }

  /// `Page Not Found`
  String get pageNotFound {
    return Intl.message(
      'Page Not Found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `{price} Bells`
  String priceInBells(Object price) {
    return Intl.message(
      '$price Bells',
      name: 'priceInBells',
      desc: '',
      args: [price],
    );
  }

  /// `Price ({place})`
  String priceTitle(Object place) {
    return Intl.message(
      'Price ($place)',
      name: 'priceTitle',
      desc: '',
      args: [place],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Hello, {name}`
  String profileGreetings(Object name) {
    return Intl.message(
      'Hello, $name',
      name: 'profileGreetings',
      desc: '',
      args: [name],
    );
  }

  /// `Sea Creatures`
  String get seaCreatures {
    return Intl.message(
      'Sea Creatures',
      name: 'seaCreatures',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settingsDarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'settingsDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Environment`
  String get settingsEnvironment {
    return Intl.message(
      'Environment',
      name: 'settingsEnvironment',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsLanguage {
    return Intl.message(
      'Language',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Shadow Size`
  String get shadowTitle {
    return Intl.message(
      'Shadow Size',
      name: 'shadowTitle',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Show Names In`
  String get showNamesIn {
    return Intl.message(
      'Show Names In',
      name: 'showNamesIn',
      desc: '',
      args: [],
    );
  }

  /// `South`
  String get south {
    return Intl.message(
      'South',
      name: 'south',
      desc: '',
      args: [],
    );
  }

  /// `Speed`
  String get speedTitle {
    return Intl.message(
      'Speed',
      name: 'speedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (final supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
