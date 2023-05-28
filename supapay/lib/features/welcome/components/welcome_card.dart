import 'package:flutter/material.dart';
import 'custom_button.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.button})
      : super(key: key);

  final String title;
  final String subTitle;
  final CustomButton button;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.grey),
                )),
            button
          ],
        ),
      ),
    );
  }
}
