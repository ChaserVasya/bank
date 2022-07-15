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

// final darkTheme = ThemeData(
//   colorScheme: const ColorScheme(
//     brightness: Brightness.dark,
//     background: Colors.white54,
//     onBackground: Colors.white54,
//     error: Colors.white54,
//     onError: Colors.white70,
//     primary: Colors.black,
//     onPrimary: Colors.white54,
//     secondary: Colors.white54,
//     onSecondary: Colors.black,
//     surface: Colors.black,
//     onSurface: Colors.white54,
//   ),
// );

final darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    background: Colors.black,
    onBackground: Colors.black,
    error: Colors.black,
    onError: Colors.black,
    primary: Colors.black,
    onPrimary: Colors.black,
    secondary: Colors.black,
    onSecondary: Colors.black,
    surface: Colors.black,
    onSurface: Colors.black,
  ),
);
