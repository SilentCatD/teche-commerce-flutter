import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        canvasColor: Colors.white,
        primaryColor: const Color.fromRGBO(4, 4, 3, 1),
        colorScheme: const ColorScheme.light().copyWith(
          primary: Color.fromRGBO(4, 4, 3, 1),
          secondary: Color.fromRGBO(179, 84, 30, 1),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color.fromRGBO(4, 4, 3, 1),
          shape: CircularNotchedRectangle(),
        ));
  }
}
