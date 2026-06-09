import 'package:flutter/material.dart';

var kLightColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 20, 120, 50),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 20, 120, 50),
  brightness: Brightness.dark,
);

final ThemeData lightTheme = ThemeData().copyWith(
  colorScheme: kLightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: kLightColorScheme.primaryContainer,
    foregroundColor: kLightColorScheme.onPrimaryContainer,
  ),
  cardTheme: CardThemeData(
    color: kLightColorScheme.secondaryContainer,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
  ),
  textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(
      color: kLightColorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(color: kLightColorScheme.onSurface),
    bodyLarge: TextStyle(color: kLightColorScheme.onSurface),
    bodyMedium: TextStyle(color: kLightColorScheme.onSurfaceVariant),
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: kDarkColorScheme.primaryContainer,
    foregroundColor: kDarkColorScheme.onPrimaryContainer,
  ),
  cardTheme: CardThemeData(
    color: kDarkColorScheme.secondaryContainer,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
    titleLarge: TextStyle(
      color: kDarkColorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(color: kDarkColorScheme.onSurface),
    bodyLarge: TextStyle(color: kDarkColorScheme.onSurface),
    bodyMedium: TextStyle(color: kDarkColorScheme.onSurfaceVariant),
  ),
);
