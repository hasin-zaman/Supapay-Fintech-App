import 'package:flutter/material.dart';

ThemeData darkTheme() {
    return ThemeData(
          colorSchemeSeed: const Color(0xFF1C6758),
          brightness: Brightness.dark,
          useMaterial3: true);
  }

  ThemeData lightTheme() {
    return ThemeData(
        colorSchemeSeed: const Color(0xFF1C6758),
        brightness: Brightness.light,
        useMaterial3: true,
      );
  }