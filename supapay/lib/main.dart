import 'package:flutter/material.dart';
import 'package:supapay/global/routes.dart';
import 'package:supapay/global/theme.dart';
import 'global/settings.dart';

void main() async {
  await appInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SupaPay',
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      initialRoute: '/home',
      routes: routes,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
    );
  }
}
