import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/global/components/custom_button_large.dart';

class ForgotPIN extends StatelessWidget {
  const ForgotPIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF1C6758),
              scrolledUnderElevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF1C6758),
                Color(0xFF26806E),
                Color(0xFF279C84),
              ], begin: Alignment.topRight)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 140),
                    Text(
                      "Forgot PIN?",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Change PIN code or Logout to Signup as a new user.",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    Spacer(),
                    CustomButtonLarge(
                      buttonText: "Change PIN ->",
                      buttonColor: const Color(0xFFEEF2E6),
                      textColor: const Color(0xFF1C6758),
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot-pin/phone-verification');
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButtonLarge(
                      buttonText: "Logout ->",
                      buttonColor: const Color(0xFF1C6758),
                      textColor: Color(0xFFEEF2E6),
                      onTap: () async {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/welcome', (Route<dynamic> route) => false);
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.clear();
                      },
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )));
  }
}
