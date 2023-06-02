import 'package:flutter/material.dart';
import 'package:supapay/global/components/custom_button_large.dart';

class SuccessChangePIN extends StatelessWidget {
  const SuccessChangePIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF1C6758),
              scrolledUnderElevation: 0,
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
                    Spacer(),
                    Text(
                      "Success!",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your PIN has been successfully changed.",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    Spacer(),
                    CustomButtonLarge(
                      buttonText: "Continue to Login ->",
                      buttonColor: const Color(0xFF1C6758),
                      textColor: Color(0xFFEEF2E6),
                      onTap: () async {
                        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                      },
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            )));
  }
}
