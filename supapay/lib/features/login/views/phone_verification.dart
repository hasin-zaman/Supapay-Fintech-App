import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supapay/features/signup/components/signup_progress_indicator.dart';
import 'package:supapay/features/signup/components/text_field.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:supapay/global/components/view_sub_heading.dart';

class PhoneVerificationLogin extends StatelessWidget {
  const PhoneVerificationLogin({Key? key}) : super(key: key);

  static String verificationId="";
  static String phone="";

  @override
  Widget build(BuildContext context) {

    TextEditingController phone = TextEditingController(text: "");

    return SafeArea(
        child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF1C6758),
                        Color(0xFF26806E),
                        Color(0xFF279C84),
                      ],
                      begin: Alignment.topRight
                  )
              ),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/signup_otp.png", width: 150, height: 150),
                      SizedBox(height: 20),
                      ViewHeading(heading: "Phone Verification."),
                      ViewSubHeading(heading: "Enter your phone number with country code. "),
                      SizedBox(height: 30),
                      CustomTextField(
                          textInputType: TextInputType.phone,
                          labelText: "Phone",
                          hintText: "Example 923331234567",
                          obscureText: false,
                          controller: phone,
                          icon: Icon(Icons.phone)),
                      SizedBox(height: 20),
                      CustomButton(
                          buttonText: "Send OTP",
                          buttonColor: const Color(0xFF1C6758),
                          textColor: Color(0xFFEEF2E6),
                          onTap: () async {
                            PhoneVerificationLogin.phone=phone.text;
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '${"+" + phone.text}',
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                if (e.code == 'invalid-phone-number') {
                                  print('Invalid phone number.');
                                }
                              },
                              codeSent: (String verificationId, int? resendToken) {
                                PhoneVerificationLogin.verificationId=verificationId;
                                Navigator.pushNamed(context, '/login/otp');
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );
                          }
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
