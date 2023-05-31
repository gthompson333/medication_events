import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropellerTheme {
  static Color propellerBlue = const Color.fromARGB(255, 0, 117, 227);
  static Color propellerLightBlue = const Color.fromARGB(255, 241, 247, 253);

  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: propellerBlue,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: propellerBlue,
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 10.0,
      fontWeight: FontWeight.w700,
      color: propellerBlue,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: propellerBlue,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.lightBlue,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Colors.lightBlue,
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Colors.lightBlue,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.lightBlue,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      textTheme: darkTextTheme,
    );
  }
}
