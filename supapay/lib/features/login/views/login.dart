import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/global/components/custom_button.dart';

import '../../../global/components/pass_code.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static var code="";
  static var pin="";

  Future<String?> getPasscode(String? phone) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection(''
          'Users')
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentSnapshot<Map<String, dynamic>> doc = snapshot.docs.first;
        final String? passcode = doc.data()!['passcode'];
        return passcode;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    final key = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
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
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Image.asset("assets/splash.png", width: 200),
                SizedBox(height: 120),
                PassCode(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter PIN.';
                    }
                    else if (value?.length!=4) {
                      return 'Invalid length PIN.';
                    }
                    else if(value!=pin){
                      return 'Wrong PIN';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                CustomButton(
                  buttonText: "Login",
                  buttonColor: const Color(0xFFEEF2E6),
                  textColor: const Color(0xFF1C6758),
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    final String? phone = prefs.getString('accNumber');
                    final String? passcode=await getPasscode(phone);

                    pin=passcode!;

                      if(key.currentState!.validate()){
                        if(passcode==code && code!=""){
                          code="";
                          pin="";
                          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                        }
                        else{
                          print("Error occured. Login failed.");
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-pin');
                      },
                      child: Text(
                        'Forgot PIN?',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white70
                        ),
                      )
                  ),
                  SizedBox(height: 70)
                ],
              ),
          ),
          ),
        ),
      );
  }
}
