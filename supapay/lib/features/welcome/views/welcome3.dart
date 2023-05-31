import 'package:flutter/material.dart';
import 'package:supapay/features/signup/views/signup.dart';
import 'package:supapay/global/components/custom_button.dart';

import '../components/welcome_card.dart';

class Welcome3 extends StatelessWidget {
  const Welcome3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFEEF2E6),
          appBar: AppBar(
            backgroundColor: const Color(0xFFEEF2E6),
          ),
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                    child: Image.asset("assets/welcome3.png")),
                const Spacer(),
                WelcomeCard(
                  title: "Get Started!",
                  subTitle: "Lorem ipsum dolor sit amet, consectetur adipisci",
                  button: CustomButton(
                    buttonText: "Create Account",
                    buttonColor: const Color(0xFF1C6758),
                    textColor: Color(0xFFEEF2E6),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/signup', (route) => false);
                    },
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          )),
    );
  }
}
