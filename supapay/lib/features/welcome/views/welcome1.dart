import 'package:flutter/material.dart';
import 'package:supapay/features/welcome/views/welcome2.dart';
import 'package:supapay/global/components/custom_button.dart';

import '../components/welcome_card.dart';

class Welcome1 extends StatelessWidget {
  const Welcome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFEEF2E6),
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                    child: Image.asset("assets/welcome1.png")),
                const Spacer(),
                WelcomeCard(
                    title: "Welcome to Supapay!",
                    subTitle: "One Mobile App for all your finance needs!",
                    button: CustomButton(
                      buttonText: "Next",
                      buttonColor: const Color(0xFF1C6758),
                      textColor: Color(0xFFEEF2E6),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Welcome2()));
                      },
                    )
                ),
                SizedBox(height: 30)
              ],
            ),
          )),
    );
  }
}
