import 'package:flutter/material.dart';
import 'package:supapay/features/home/views/home_screen.dart';

Map<String, WidgetBuilder> get routes {
    return {
        '/home':(context) => const Home(),
      };
  }