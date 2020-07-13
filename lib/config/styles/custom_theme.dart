import 'package:flutter/material.dart';

final backgroundColor = Color(0xFF264653);
final navigationColor = Color(0xFF203B46);
final persianGreen = Color(0xFF2A9D8F);
final orangeYellow = Color(0xFFE9C46A);

final ThemeData customTheme = ThemeData.dark().copyWith(
  primaryColor: persianGreen,
  accentColor: orangeYellow,
  appBarTheme: AppBarTheme(
    color: backgroundColor,
    elevation: 0.0,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: backgroundColor,
  canvasColor: navigationColor,
  cardColor: Color(0xFF425864),
  cardTheme: CardTheme(
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
