import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: Colors.white54,
    onBackground: Colors.white70,
    error: Colors.red,
    onError: Colors.white70,
    primary: Colors.black,
    onPrimary: Colors.white70,
    secondary: Colors.black,
    onSecondary: Colors.white70,
    surface: Colors.white70,
    onSurface: Colors.black,
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    background: Colors.black,
    onBackground: Colors.white54,
    error: Colors.white30,
    onError: Colors.white70,
    primary: Colors.black,
    onPrimary: Colors.white54,
    secondary: Colors.grey[900]!,
    onSecondary: Colors.white54,
    surface: Colors.black,
    onSurface: Colors.white54,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(darkTextStyle.color),
    ),
  ),
);

final lightBlackTheme = darkTheme.copyWith(
  colorScheme: darkTheme.colorScheme.copyWith(
    brightness: Brightness.light,
  ),
);

const darkTextStyle = TextStyle(
  color: Colors.white70,
  backgroundColor: Colors.transparent,
  decorationColor: Colors.white70,
);

const lightTextStyle = TextStyle(
  color: Colors.black,
  backgroundColor: Colors.transparent,
  decorationColor: Colors.black,
);
