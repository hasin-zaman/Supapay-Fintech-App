import 'package:flutter/material.dart';
import 'package:supapay/features/home/views/home.dart';
import 'package:supapay/features/qr_code/views/qr_screen.dart';

Map<String, WidgetBuilder> get routes {
    return {
        '/home':(context) => Home(),
        '/home/qr':(context) => const QRScreen()
      };
  }