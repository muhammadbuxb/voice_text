import 'package:flutter/material.dart';

class AppThemes {
  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.lightGreen,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightGreen,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white)
    )
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white)
    )
  );
}
