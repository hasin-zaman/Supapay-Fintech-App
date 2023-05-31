import 'package:flutter/material.dart';
import 'package:supapay/features/welcome/views/welcome3.dart';
import 'package:supapay/global/components/custom_button.dart';

import '../components/welcome_card.dart';

class Welcome2 extends StatelessWidget {
  const Welcome2({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Image.asset("assets/welcome2.png")),
                const Spacer(),
                WelcomeCard(
                  title: "Connect All Wallets!",
                  subTitle: "Lorem ipsum dolor sit amet, consectetur adipisci",
                  button: CustomButton(
                    buttonText: "Next",
                    buttonColor: const Color(0xFFEEF2E6),
                    textColor: const Color(0xFF1C6758),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Welcome3()));
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
