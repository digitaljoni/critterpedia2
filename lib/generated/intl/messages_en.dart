// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(name) => "Hello, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("Critterpedia"),
    "confirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "currentHour" : MessageLookupByLibrary.simpleMessage("Current Hour"),
    "currentMonth" : MessageLookupByLibrary.simpleMessage("Current Month"),
    "dateTime" : MessageLookupByLibrary.simpleMessage("Date/Time"),
    "fish" : MessageLookupByLibrary.simpleMessage("Fish"),
    "hemisphere" : MessageLookupByLibrary.simpleMessage("Hemisphere"),
    "insects" : MessageLookupByLibrary.simpleMessage("Insects"),
    "location" : MessageLookupByLibrary.simpleMessage("Location"),
    "locationTab" : MessageLookupByLibrary.simpleMessage("Location Tab"),
    "main" : MessageLookupByLibrary.simpleMessage("Main"),
    "mainTab" : MessageLookupByLibrary.simpleMessage("Main Tab"),
    "north" : MessageLookupByLibrary.simpleMessage("North"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "profileGreetings" : m0,
    "seaCreatures" : MessageLookupByLibrary.simpleMessage("Sea Creatures"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsDarkMode" : MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "settingsEnvironment" : MessageLookupByLibrary.simpleMessage("Environment"),
    "settingsLanguage" : MessageLookupByLibrary.simpleMessage("Language"),
    "south" : MessageLookupByLibrary.simpleMessage("South"),
    "unknown" : MessageLookupByLibrary.simpleMessage("Unknown")
  };
}
