import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color.fromRGBO(4, 4, 3, 1),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color.fromRGBO(4, 4, 3, 1),
        secondary: const Color.fromRGBO(179, 84, 30, 1),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color.fromRGBO(4, 4, 3, 1),
        shape: CircularNotchedRectangle(),
      ),
      textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
    );
  }
}
