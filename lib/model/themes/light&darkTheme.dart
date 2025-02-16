import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffEDE9FE),
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xffEDE9FE),
        foregroundColor: Color(0xffEDE9FE),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(color: Colors.black)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );
}
