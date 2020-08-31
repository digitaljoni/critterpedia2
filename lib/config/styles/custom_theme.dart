import 'package:flutter/material.dart';

const backgroundColor = Color(0xFF264653);
const navigationColor = Color(0xFF203B46);
const persianGreen = Color(0xFF2A9D8F);
const orangeYellow = Color(0xFFE9C46A);

final ThemeData customTheme = ThemeData.dark().copyWith(
  primaryColor: persianGreen,
  accentColor: orangeYellow,
  appBarTheme: const AppBarTheme(
    color: backgroundColor,
    elevation: 0.0,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: backgroundColor,
  canvasColor: navigationColor,
  cardColor: const Color(0xFF425864),
  cardTheme: const CardTheme(
    color: Colors.white24,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          8.0,
        ),
      ),
    ),
  ),
);
