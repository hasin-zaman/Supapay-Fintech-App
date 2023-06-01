import 'package:flutter/material.dart';
import 'package:supapay/global/components/custom_button.dart';


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
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 230,
        child: Column(
          children: [
            Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 3),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey),
            ),
            Spacer(),
            button,
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
