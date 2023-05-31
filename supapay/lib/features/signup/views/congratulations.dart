import 'package:flutter/material.dart';
import 'package:supapay/features/signup/components/signup_progress_indicator.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/view_heading.dart';

class Congratulations extends StatelessWidget {
  const Congratulations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFEEF2E6),
            appBar: AppBar(
              flexibleSpace: Center(
                child: SignupProgressIndicator(value1: 0, value2: 0, value3: 0, value4: 1),
              ),
              backgroundColor: const Color(0xFFEEF2E6),
              scrolledUnderElevation: 0,
            ),
            body: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    ViewHeading(heading: "Congratulations! You are all set up to be part of Supapay's journey!"),
                    SizedBox(height: 20),
                    CustomButton(
                        buttonText: "Sign In",
                        buttonColor: const Color(0xFF1C6758),
                        textColor: Color(0xFFEEF2E6),
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
