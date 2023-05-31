import 'package:flutter/material.dart';
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
    '/home': (context) => Home(),
    '/home/qr': (context) => const QRScreen(),
    '/home/atms': (context) => const ATMInfo(),
    '/home/support': (context) => const SupportScreen(),
    '/home/transactions': (context) => TransactionsScreen(),
    '/home/addFunds': (context) => const AddFundsPage(),
    '/home/sendFunds': (context) => SendFundsPage(),
  };
}