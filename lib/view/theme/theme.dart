import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: const Color.fromRGBO(4, 4, 3, 1),
        colorScheme: const ColorScheme.light().copyWith(
          primary: Color.fromRGBO(4, 4, 3, 1),
          secondary: Color.fromRGBO(179, 84, 30, 1),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color.fromRGBO(4, 4, 3, 1),
          shape: CircularNotchedRectangle(),
        ));
  }
}
