import 'package:flutter/material.dart';

class DarkAppColors {
  static const Color primary = Color(0xFF4E6EF2);
  static const Color background = Color(0xFF0D0E11); // pure dark
  static const Color surface = Color(0xFF171A1F);
  static const Color onPrimary = Colors.white;
  static const Color onBackground = Color(0xFFE9EEF7);
  static const Color onSurface = Color(0xFFE9EEF7);
  static const Color divider = Color(0xFF2A2F36);
}

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: DarkAppColors.background,
  primaryColor: DarkAppColors.primary,
  colorScheme: const ColorScheme.dark(
    primary: DarkAppColors.primary,
    surface: DarkAppColors.surface,
    onPrimary: DarkAppColors.onPrimary,
    onSurface: DarkAppColors.onSurface,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: DarkAppColors.surface,
    elevation: 0,
    foregroundColor: DarkAppColors.onBackground,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: DarkAppColors.onBackground,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: DarkAppColors.onBackground,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: DarkAppColors.surface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: DarkAppColors.divider),
    ),
  ),
  cardTheme: CardThemeData(
    color: DarkAppColors.surface,
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: DarkAppColors.surface,
    selectedItemColor: DarkAppColors.primary,
    unselectedItemColor: DarkAppColors.onSurface.withOpacity(0.5),
  ),

  fontFamily: 'Lato',
);
