import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/features/signup/components/pin_code.dart';
import 'package:supapay/features/signup/components/signup_progress_indicator.dart';
import 'package:supapay/features/signup/models/user_model.dart';
import 'package:supapay/features/signup/views/phone_verification.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:supapay/global/components/view_sub_heading.dart';

import '../provider/user_data_provider.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  static var otp="";

  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;
    
    Future<void> saveUser(UserModel userData) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final usersCollection = FirebaseFirestore.instance.collection('Users');
      await usersCollection.doc(userData.phone).set(userData.toMap());
      await prefs.setString('accNumber', userData.phone);
    }

    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFEEF2E6),
          appBar: AppBar(
            flexibleSpace: Center(
              child: SignupProgressIndicator(value1: 0, value2: 0, value3: 1, value4: 0),
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
                  Image.asset("assets/signup_otp.png", width: 150, height: 150),
                  SizedBox(height: 20),
                  ViewHeading(heading: "Phone Verification."),
                  ViewSubHeading(heading: "Enter OTP sent to your phone number!"),
                  SizedBox(height: 30),
                  PinCode(length: 6),
                  SizedBox(height: 20),
                  CustomButton(
                    buttonText: "Verify Phone",
                    buttonColor: const Color(0xFF1C6758),
                    textColor: Color(0xFFEEF2E6),
                    onTap: () async {
                      try{
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneVerification.verificationId, smsCode: otp);
                        await auth.signInWithCredential(credential);
                        final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
                        final userData = userDataProvider.userData!;
                        await saveUser(userData);
                        userDataProvider.clearUserData();

                        Navigator.pushNamedAndRemoveUntil(context, '/congratulations', (route) => false);
                      }
                      catch(e){
                        print(e);
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
                          color: Colors.black87
                        ),
                      ))
                ],
              ),
            ),
          )
    )
    );
  }
}
