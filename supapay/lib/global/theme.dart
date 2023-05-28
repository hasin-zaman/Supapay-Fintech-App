import 'package:flutter/material.dart';

ThemeData darkTheme() {
    return ThemeData(
          colorSchemeSeed: Colors.blue,
          brightness: Brightness.dark,
          useMaterial3: true);
  }

  ThemeData lightTheme() {
    return ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      );
  }