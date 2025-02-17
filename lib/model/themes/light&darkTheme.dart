import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    
    scaffoldBackgroundColor: Color(0xffEDE9FE),
    cardTheme: CardTheme(color:Color(0xffEDE9FE)  ),
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
        cardTheme: CardTheme(color: const Color.fromARGB(209, 39, 36, 36) ),

    appBarTheme: AppBarTheme(
        foregroundColor: const Color.fromARGB(209, 39, 36, 36),
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
