import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supapay/features/signup/components/signup_progress_indicator.dart';
import 'package:supapay/global/components/text_field.dart';
import 'package:supapay/features/signup/models/user_model.dart';
import 'package:supapay/features/signup/provider/user_data_provider.dart';
import 'package:supapay/global/components/custom_button.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:intl/intl.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key=GlobalKey<FormState>();

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
          child: Form(
            key: key,
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
                    icon: Icon(Icons.account_box),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name.';
                      }
                      return null;
                    },
                ),
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
                        icon: Icon(Icons.calendar_month),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please pick your date of birth.';
                          }
                          return null;
                        },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    labelText: "Email",
                    hintText: "john_wick@gmail.com",
                    obscureText: false,
                    controller: email,
                    icon: Icon(Icons.email),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email.';
                      }
                      final validEmail=RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                      if (!validEmail.hasMatch(value)) {
                        return 'Invalid email format. Please enter valid email.';
                      }
                      return null;
                    },
                ),
                SizedBox(height: 30),
                CustomTextField(
                    textInputType: TextInputType.number,
                    labelText: "4-digit PIN",
                    hintText: "0000",
                    obscureText: true,
                    controller: passcode,
                    icon: Icon(Icons.lock),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please set your 4-digit PIN.';
                      }
                      else if(value.length!=4){
                        return 'Invalid length PIN. Please enter only 4-digit PIN.';
                      }
                      return null;
                  },
                ),
                SizedBox(height: 40),
                CustomButton(
                  buttonText: "Next",
                  buttonColor: const Color(0xFF1C6758),
                  textColor: Color(0xFFEEF2E6),
                  onTap: () {
                    if (key.currentState!.validate()) {
                      final userDataProvider =
                      Provider.of<UserDataProvider>(context, listen: false);
                      final userData = UserModel(
                          name: name.text,
                          dateOfBirth: DateFormat('dd/MM/yyyy').parse(dateOfBirth.text),
                          email: email.text,
                          passcode: passcode.text,
                          profileImageUrl: "",
                          accountNumber: '',
                          balance: 0,
                          cardNumber: '',
                          cvvCode: '',
                          expiryDate: '',
                          iban: '',
                          monthlyIncome: 0,
                          spendingLimit: 0,
                          role: '',
                      );
                      userDataProvider.setUser(userData);
                      Navigator.pushNamed(context, '/phone-verification');
                    }
                  }
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
