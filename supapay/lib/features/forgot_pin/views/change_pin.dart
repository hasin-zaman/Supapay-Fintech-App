import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supapay/global/components/custom_button.dart';
import '../../../global/components/pass_code.dart';

class ChangePIN extends StatelessWidget {
  const ChangePIN({Key? key}) : super(key: key);

  static var code="";

  Future<void> updatePIN(String? phone, String? code) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection(''
          'users')
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> document = snapshot.docs.first;
        String documentId = document.id;

        // Update the specific property
        await FirebaseFirestore.instance.collection('Users').doc(documentId).update({
          'passcode': code,
        });

        print('Property updated successfully!');
      } else {
        print("Document not found for the provided phone number.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    final key = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
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
                  Text(
                    "Change PIN",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Enter new PIN you would like to set.",
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
                  ),
                  SizedBox(height: 100),
                  PassCode(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter PIN.';
                      }
                      else if (value?.length!=4) {
                        return 'Invalid length PIN.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50),
                  CustomButton(
                    buttonText: "Enter",
                    buttonColor: const Color(0xFFEEF2E6),
                    textColor: const Color(0xFF1C6758),
                    onTap: () async {
                      if(key.currentState!.validate()){
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        final String? phone = prefs.getString('phone');

                        if(code!="" && code.length==4){
                          updatePIN(phone, code);
                          Navigator.pushNamedAndRemoveUntil(context, '/forgot-pin/success', (route) => false);
                        }
                        else{
                          print("Error occured. PIN could not be changed.");
                        }
                      }
                    },
                  ),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
