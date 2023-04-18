import 'package:flutter/material.dart';
import 'package:supapay/components/customButton.dart';
import 'package:supapay/views/welcome/welcome2.dart';
import '../../components/welcomeCard.dart';

class Welcome1 extends StatelessWidget {
  const Welcome1({Key? key}) : super(key: key);

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
                    padding: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                    child: Image.asset("assets/welcome1.png")),
                SizedBox(height: 40),
                WelcomeCard(
                    title: "Welcome to Supapay!",
                    subTitle: "One Mobile App for all your finance needs!",
                    button: CustomButton(
                      buttonText: "Next",
                      buttonColor: Color(0xFF1C6758),
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome2()));},
                    ))
              ],
            ),
          )),
    );
  }
}
