import 'package:flutter/material.dart';
import 'package:supapay/global/components/custom_button.dart';


class Welcome3 extends StatelessWidget {
  const Welcome3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFEEF2E6),
          appBar: AppBar(
            backgroundColor: const Color(0xFFEEF2E6),
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                    child: Image.asset("assets/welcome3.png")),
                const Spacer(),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 270,
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          "Get Started!",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipisci",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        CustomButton(
                          buttonText: "Sign up",
                          buttonColor: const Color(0xFF1C6758),
                          textColor: Color(0xFFEEF2E6),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/signup');
                          },
                        ),
                        SizedBox(height: 10),
                        CustomButton(
                          buttonText: "Sign in",
                          buttonColor: const Color(0xFFEEF2E6),
                          textColor: const Color(0xFF1C6758),
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/login/phone-verification');
                          },
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          )),
    );
  }
}
