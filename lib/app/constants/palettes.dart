import 'package:flutter/material.dart';

class MyPalettes {
  static const appPurple = Color(0xFF431AA1);
  static const appPurpleDark = Color(0xFF1E0771);
  static const appPurpleLight1 = Color(0xFF9345F2);
  static const appPurpleLight2 = Color(0xFFB9A2D8);
  static const appWhite = Color(0xFFFAF8FC);
  static const appOrange = Color(0xFFE6704A);

  static ThemeData appLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: appPurple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: appPurple,
      elevation: 4,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: appPurpleDark,
      ),
      bodyText2: TextStyle(
        color: appPurpleDark,
      ),
    ),
  );

  static ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: appPurpleLight2,
    scaffoldBackgroundColor: appPurpleDark,
    appBarTheme: AppBarTheme(
      backgroundColor: appPurpleDark,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: appWhite,
      ),
      bodyText2: TextStyle(
        color: appWhite,
      ),
    ),
  );
}
