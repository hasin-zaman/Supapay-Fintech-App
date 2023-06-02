import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supapay/features/signup/provider/user_data_provider.dart';
import 'package:supapay/global/routes.dart';
import 'package:supapay/global/theme.dart';
import 'global/settings.dart';

void main() async {
  await appInit();
  runApp(ChangeNotifierProvider(
      create: (_) => UserDataProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;

    String initialRoute = '/login';

    if (currentUser == null){
      initialRoute = '/welcome';
    }

    return MaterialApp(
      title: 'SupaPay',
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      initialRoute: initialRoute,
      routes: routes,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
