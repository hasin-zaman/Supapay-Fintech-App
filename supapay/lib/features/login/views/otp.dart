import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/features/login/views/phone_verification.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/pin_code.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:supapay/global/components/view_sub_heading.dart';

class OTPLogin extends StatelessWidget {
  const OTPLogin({Key? key}) : super(key: key);

  static var otp="";

  @override
  Widget build(BuildContext context) {

    final key = GlobalKey<FormState>();

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
                  child: Form(
                    key: key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/signup_otp.png", width: 150, height: 150),
                        SizedBox(height: 20),
                        ViewHeading(heading: "Phone Verification."),
                        ViewSubHeading(heading: "Enter OTP sent to your phone number ${"+" + PhoneVerificationLogin.tempPhone}"),
                        SizedBox(height: 30),
                        PinCode(length: 6),
                        SizedBox(height: 20),
                        CustomButton(
                            buttonText: "Verify Phone",
                            buttonColor: const Color(0xFF1C6758),
                            textColor: Color(0xFFEEF2E6),
                            onTap: () async {
                              if(key.currentState!.validate()){
                                try{
                                  FirebaseAuth auth = FirebaseAuth.instance;

                                  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneVerificationLogin.verificationId, smsCode: otp);
                                  await auth.signInWithCredential(credential);
                                  otp="";

                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  await prefs.setString('accountNumber', PhoneVerificationLogin.tempPhone);
                                  PhoneVerificationLogin.tempPhone="";

                                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                                }
                                catch(e){
                                  print(e);
                                }
                              }
                            }
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Edit Phone Number?',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        )
    );
  }
}
