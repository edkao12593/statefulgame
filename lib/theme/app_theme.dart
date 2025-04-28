
import 'package:flutter/material.dart';

class AppTheme {
  static const Color skinColor    = Color(0xFFA1736B);
  static const Color hairColor    = Color(0xFF3E343F);
  static const Color shutterColor = Color(0xFF979F9B);
  static const Color wallColor    = Color(0xFFC9BFB6);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: wallColor,

      colorScheme: const ColorScheme.light(
        primary: skinColor,
        onPrimary: Colors.white,
        secondary: hairColor,
        onSecondary: Colors.white,
        surface: wallColor,
        onSurface: Colors.black87,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: skinColor,
        foregroundColor: Colors.white,
        elevation: 2,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: hairColor,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        ),
      ),

      cardTheme: const CardTheme(
        color: shutterColor,
        elevation: 4,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: shutterColor,
      ),

      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black87),
        titleLarge: TextStyle(color: hairColor),
      ),
    );
  }
}
