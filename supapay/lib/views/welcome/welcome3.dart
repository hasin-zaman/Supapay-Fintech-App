import 'package:flutter/material.dart';
import 'package:supapay/components/customButton.dart';
import '../../components/welcomeCard.dart';

class Welcome3 extends StatelessWidget {
  const Welcome3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFEEF2E6),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 55),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                    child: Image.asset("assets/welcome3.png")),
                SizedBox(height: 55),
                WelcomeCard(
                  title: "Get Started!",
                  subTitle: "Lorem ipsum dolor sit amet, consectetur adipisci",
                  button: CustomButton(
                    buttonText: "Create Account",
                    buttonColor: Color(0xFF1C6758),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
