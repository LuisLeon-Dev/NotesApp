import 'package:flutter/material.dart';

class AppTheme {
  static const _seed = Color(0xFF6FA8DC);

  static final ColorScheme _lightScheme =
      ColorScheme.fromSeed(
        seedColor: _seed,
        brightness: Brightness.light,
      ).copyWith(
        primary: Colors.black,
        onPrimary: Colors.white,
        surface: const Color(0xFFF2F2F2),
        onSurface: Colors.black87,
      );

  static final ColorScheme _darkScheme =
      ColorScheme.fromSeed(
        seedColor: _seed,
        brightness: Brightness.dark,
      ).copyWith(
        primary: Colors.white,
        onPrimary: Colors.black,

        surface: const Color(0xFF2C2C2C),
        onSurface: Colors.white,
      );

  // Tema claro
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightScheme,
    scaffoldBackgroundColor: _lightScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: _lightScheme.surface,
      foregroundColor: _lightScheme.onSurface,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),

    cardTheme: CardThemeData(
      color: _lightScheme.surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightScheme.primary,
      foregroundColor: _lightScheme.onPrimary,
      elevation: 2,
      shape: const StadiumBorder(),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ),
  );

  // Tema oscuro
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkScheme,
    scaffoldBackgroundColor: _darkScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: _darkScheme.surface,
      foregroundColor: _darkScheme.onSurface,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),

    cardTheme: CardThemeData(
      color: _darkScheme.surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkScheme.primary,
      foregroundColor: _darkScheme.onPrimary,
      elevation: 2,
      shape: const StadiumBorder(),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    ),
  );

  static const noteColorsLight = <Color>[
    Color(0xFFF6AFFF), // rosa
    Color(0xFFF6A5A5), // coral
    Color(0xFFA5F6A5), // verde suave
    Color(0xFFF6F6A5), // amarillo
    Color(0xFFA5F6F6), // celeste
    Color(0xFFC5A5F6), // lila
  ];

  static const noteColorsDark = <Color>[
    Color(0xFFBF86CC), // rosa ajustado
    Color(0xFFCC7E7E), // coral ajustado
    Color(0xFF78C978), // verde ajustado
    Color(0xFFCAC96D), // amarillo ajustado
    Color(0xFF6EBDBD), // celeste ajustado
    Color(0xFFA184DA), // lila ajustado
  ];
}
