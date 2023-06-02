import 'package:flutter/material.dart';
import 'package:supapay/features/forgot_pin/views/change_pin.dart';
import 'package:supapay/features/forgot_pin/views/forgot_pin.dart';
import 'package:supapay/features/forgot_pin/views/otp.dart';
import 'package:supapay/features/forgot_pin/views/phone_verification.dart';
import 'package:supapay/features/login/views/login.dart';
import 'package:supapay/features/login/views/otp.dart';
import 'package:supapay/features/login/views/phone_verification.dart';
import 'package:supapay/features/signup/views/congratulations.dart';
import 'package:supapay/features/signup/views/otp.dart';
import 'package:supapay/features/signup/views/phone_verification.dart';
import 'package:supapay/features/signup/views/signup.dart';
import 'package:supapay/features/welcome/views/welcome1.dart';
import 'package:supapay/features/atmsInfo/views/atm_screen.dart';
import 'package:supapay/features/customer_support/views/support_page.dart';
import 'package:supapay/features/home/views/add_funds_page.dart';
import 'package:supapay/features/home/views/home.dart';
import 'package:supapay/features/qr_code/views/qr_screen.dart';
import 'package:supapay/features/sendFunds/views/send_funds_page.dart';
import 'package:supapay/features/transactions/views/transactions_screen.dart';

Map<String, WidgetBuilder> get routes {
  return {
    '/welcome': (context) => const Welcome1(),
    '/signup': (context) => const Signup(),
    '/phone-verification': (context) => const PhoneVerification(),
    '/otp': (context) => const OTP(),
    '/congratulations': (context) => const Congratulations(),
    '/login/phone-verification': (context) => const PhoneVerificationLogin(),
    '/login/otp': (context) => const OTPLogin(),
    '/login': (context) => const Login(),
    '/forgot-pin': (context) => const ForgotPIN(),
    '/forgot-pin/phone-verification': (context) => const PhoneVerificationForgotPIN(),
    '/forgot-pin/otp': (context) => const OTPForgotPIN(),
    '/forgot-pin/change-pin': (context) => const ChangePIN(),
    '/home': (context) => Home(),
    '/home/qr': (context) => const QRScreen(),
    '/home/atms': (context) => const ATMInfo(),
    '/home/support': (context) => const SupportScreen(),
    '/home/transactions': (context) => TransactionsScreen(),
    '/home/addFunds': (context) => const AddFundsPage(),
    '/home/sendFunds': (context) => SendFundsPage(),
  };
}