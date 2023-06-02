import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supapay/features/signup/components/signup_progress_indicator.dart';
import 'package:supapay/features/signup/components/text_field.dart';
import 'package:supapay/features/signup/models/user_model.dart';
import 'package:supapay/features/signup/provider/user_data_provider.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:intl/intl.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(text: "");
    TextEditingController dateOfBirth = TextEditingController(text: "");
    TextEditingController email = TextEditingController(text: "");
    TextEditingController passcode = TextEditingController(text: "");

    Future<void> pickDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1923),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xFF1C6758),
                ),
              ),
            child: child!
          );
        }
      );
      if (picked != null) {
        dateOfBirth.text = DateFormat('dd/MM/yyyy').format(picked);
      }
    }

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
              value1: 1, value2: 0, value3: 0, value4: 0),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ViewHeading(heading: "Let's Setup Your Account."),
              SizedBox(height: 45),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/user_default.png'),
                backgroundColor: Color(0xFFCFCFCF),
              ),
              SizedBox(height: 30),
              CustomTextField(
                  textInputType: TextInputType.name,
                  labelText: "Full Name",
                  hintText: "John Wick",
                  obscureText: false,
                  controller: name,
                  icon: Icon(Icons.account_box)),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  pickDate(context);
                },
                child: AbsorbPointer(
                  child: CustomTextField(
                      textInputType: TextInputType.datetime,
                      labelText: "Date of Birth",
                      hintText: "dd/MM/year",
                      obscureText: false,
                      controller: dateOfBirth,
                      icon: Icon(Icons.calendar_month)),
                ),
              ),
              SizedBox(height: 30),
              CustomTextField(
                  textInputType: TextInputType.emailAddress,
                  labelText: "Email",
                  hintText: "john_wick@gmail.com",
                  obscureText: false,
                  controller: email,
                  icon: Icon(Icons.email)),
              SizedBox(height: 30),
              CustomTextField(
                  textInputType: TextInputType.number,
                  labelText: "4-digit passcode",
                  hintText: "1234",
                  obscureText: true,
                  controller: passcode,
                  icon: Icon(Icons.lock)),
              SizedBox(height: 40),
              CustomButton(
                buttonText: "Next",
                buttonColor: const Color(0xFF1C6758),
                textColor: Color(0xFFEEF2E6),
                onTap: () {
                  final userDataProvider =
                      Provider.of<UserDataProvider>(context, listen: false);
                  final userData = UserModel(
                      name: name.text,
                      dateOfBirth: DateTime.parse(dateOfBirth.text),
                      gender: "Male",
                      email: email.text,
                      passcode: passcode.text,
                      profileImageUrl: "",
                      phone: '',
                      accountNumber: '',
                      balance: 0,
                      cardNumber: '',
                      cvvCode: '',
                      expiryDate: '',
                      iban: '',
                      monthlyIncome: 0,
                      spendingLimit: 0);
                  userDataProvider.setUser(userData);
                  Navigator.pushNamed(context, '/phone-verification');
                },
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    ));
  }
}
