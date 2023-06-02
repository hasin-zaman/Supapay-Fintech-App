import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supapay/features/signup/components/signup_progress_indicator.dart';
import 'package:supapay/global/components/text_field.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:supapay/global/components/view_sub_heading.dart';
import '../models/user_model.dart';
import '../provider/user_data_provider.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  static String verificationId="";
  static String tempPhone="";

  @override
  Widget build(BuildContext context) {

    final key = GlobalKey<FormState>();
    TextEditingController phone = TextEditingController(text: "");

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
              flexibleSpace: Center(
                child: SignupProgressIndicator(
                    value1: 0, value2: 1, value3: 0, value4: 0),
              ),
            ),
            body: Container(
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
                      ViewSubHeading(heading: "Enter your phone number with country code. "),
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
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: '${"+" + phone.text}',
                                verificationCompleted: (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {
                                  if (e.code == 'invalid-phone-number') {
                                    print('Invalid phone number.');
                                  }
                                },
                                codeSent: (String verificationId, int? resendToken) {
                                  PhoneVerification.verificationId=verificationId;
                                  final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
                                  final userData=userDataProvider.userData!;
                                  userDataProvider.setUser(
                                      UserModel(
                                          name: userData.name,
                                          dateOfBirth: userData.dateOfBirth,
                                          gender: userData.gender,
                                          email: userData.email,
                                          passcode: userData.passcode,
                                          profileImageUrl: userData.profileImageUrl,
                                          phone: phone.text.toString(),
                                          accountNumber: phone.text.toString(),
                                          balance: 0,
                                          cardNumber: '5238333370318899',
                                          cvvCode: '900',
                                          expiryDate: '06/2031',
                                          iban: 'PK 12 SUPA 000001 ${phone.text.substring(0,9)}',
                                          monthlyIncome: 15000,
                                          spendingLimit: 50000
                                      )
                                  );
                                  Navigator.pushNamed(context, '/otp');
                                },
                                codeAutoRetrievalTimeout: (String verificationId) {},
                              );
                            }
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
