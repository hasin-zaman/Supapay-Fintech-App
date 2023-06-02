import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supapay/global/components/text_field.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:supapay/global/components/view_sub_heading.dart';

class PhoneVerificationForgotPIN extends StatelessWidget {
  const PhoneVerificationForgotPIN({Key? key}) : super(key: key);

  static String verificationId="";
  static String tempPhone="";

  @override
  Widget build(BuildContext context) {

    final key = GlobalKey<FormState>();
    TextEditingController phone = TextEditingController(text: "");

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF1C6758),
              scrolledUnderElevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
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
                        ViewSubHeading(heading: "Enter your phone number with country code to continue."),
                        SizedBox(height: 30),
                        CustomTextField(
                            textInputType: TextInputType.phone,
                            labelText: "Phone",
                            hintText: "Example 923331234567",
                            obscureText: false,
                            controller: phone,
                            icon: Icon(Icons.phone),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number.';
                              }
                              else if(!value.startsWith('92')){
                                return 'Phone numbers should start with country code eg. +92';
                              }
                              if (value.length < 11) {
                                return 'Invalid length.';
                              }
                              return null;
                            },
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                            buttonText: "Send OTP",
                            buttonColor: const Color(0xFF1C6758),
                            textColor: Color(0xFFEEF2E6),
                            onTap: () async {
                              if(key.currentState!.validate()){
                                tempPhone=phone.text;

                                FirebaseAuth auth = FirebaseAuth.instance;
                                final currentUser = auth.currentUser;

                                if(currentUser?.phoneNumber=='${"+" + phone.text}'){
                                  await auth.verifyPhoneNumber(
                                    phoneNumber: '${"+" + phone.text}',
                                    verificationCompleted: (PhoneAuthCredential credential) {},
                                    verificationFailed: (FirebaseAuthException e) {
                                      if (e.code == 'invalid-phone-number') {
                                        print('Invalid phone number.');
                                      }
                                    },
                                    codeSent: (String verificationId, int? resendToken) {
                                      PhoneVerificationForgotPIN.verificationId=verificationId;
                                      Navigator.pushNamed(context, '/forgot-pin/otp');
                                    },
                                    codeAutoRetrievalTimeout: (String verificationId) {},
                                  );
                                }
                                else{
                                  print("Invalid Number. Enter number you are signed in with.");
                                }
                              }
                            }
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
