import 'package:flutter/material.dart';
import 'package:supapay/components/customButton.dart';
import 'package:supapay/views/welcome/welcome3.dart';
import '../../components/welcomeCard.dart';

class Welcome2 extends StatelessWidget {
  const Welcome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFEEF2E6),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Image.asset("assets/welcome2.png")),
                SizedBox(height: 40),
                WelcomeCard(
                  title: "Connect All Wallets!",
                  subTitle: "Lorem ipsum dolor sit amet, consectetur adipisci",
                  button: CustomButton(
                    buttonText: "Next",
                    buttonColor: Color(0xFFEEF2E6),
                    textColor: Color(0xFF1C6758),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome3()));},
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
