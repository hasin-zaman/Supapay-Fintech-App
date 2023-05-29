import 'package:flutter/material.dart';
import 'package:supapay/features/home/views/home.dart';

Map<String, WidgetBuilder> get routes {
    return {
        '/home':(context) => Home(),
      };
  }