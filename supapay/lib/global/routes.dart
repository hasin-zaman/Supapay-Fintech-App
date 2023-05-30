import 'package:flutter/material.dart';
import 'package:supapay/features/atmsInfo/views/atm_screen.dart';
import 'package:supapay/features/customer_support/views/support_page.dart';
import 'package:supapay/features/home/views/add_funds_page.dart';
import 'package:supapay/features/home/views/home.dart';
import 'package:supapay/features/qr_code/views/qr_screen.dart';
import 'package:supapay/features/transactions/views/transactions_screen.dart';

Map<String, WidgetBuilder> get routes {
    return {
        '/home':(context) => Home(),
        '/home/qr':(context) => const QRScreen(),
        '/home/atms': (context) => const ATMInfo(),
        '/home/support':(context) => const SupportScreen(),
        '/home/transactions':(context) => TransactionsScreen(),
        '/home/addFunds':(context) => const AddFundsPage(),
      };
  }