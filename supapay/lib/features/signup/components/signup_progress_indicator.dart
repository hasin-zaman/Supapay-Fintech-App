import 'package:flutter/material.dart';
import 'package:supapay/features/signup/components/progress_indicator.dart';

class SignupProgressIndicator extends StatelessWidget {
  const SignupProgressIndicator({Key? key, required this.value1, required this.value2, required this.value3, required this.value4}) : super(key: key);

  final double value1, value2, value3, value4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255,
      child: Center(
        child: Row(
          children: [
            CustomProgressIndicator(value: value1),
            SizedBox(width: 5),
            CustomProgressIndicator(value: value2),
            SizedBox(width: 5),
            CustomProgressIndicator(value: value3),
            SizedBox(width: 5),
            CustomProgressIndicator(value: value4)
          ],
        ),
      )
    );
  }
}
