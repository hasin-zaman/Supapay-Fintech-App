import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supapay/features/signup/provider/user_data_provider.dart';
import 'package:supapay/global/loginState.dart';
import 'package:supapay/global/routes.dart';
import 'package:supapay/global/theme.dart';
import 'global/settings.dart';

void main() async {
  await appInit();
  bool isSignedUp=await userSignupState();
  print("Login State: \n");
  print(isSignedUp);

  runApp(ChangeNotifierProvider(
      create: (_) => UserDataProvider(),
      child: MyApp(initialRoute: isSignedUp ? '/welcome' : '/welcome')));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
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
