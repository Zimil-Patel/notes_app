import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final _primaryDark = Color(0xff181c14);
  static final _secondaryDark = Color(0xff3c3d37);
  static final _surfaceDark = Color(0xff697565);
  static final _onSurfaceDark = Color(0xff697565);

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: _primaryDark,
    colorScheme: ColorScheme.dark(
      primary: _primaryDark,
      secondary: _secondaryDark,
      onPrimary: _secondaryDark,
      surface: _surfaceDark,
      onSurface: _onSurfaceDark,
    ),
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: _surfaceDark),

    // TEXT THEME
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.varelaRound(),
      bodyMedium: GoogleFonts.varelaRound(),
      bodySmall: GoogleFonts.varelaRound(),
      titleLarge: GoogleFonts.varelaRound(),
      titleMedium: GoogleFonts.varelaRound(),
      titleSmall: GoogleFonts.varelaRound(),
      labelLarge: GoogleFonts.varelaRound(),
      labelMedium: GoogleFonts.varelaRound(),
      labelSmall: GoogleFonts.varelaRound(),
    ),
  );
}
