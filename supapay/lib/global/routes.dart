import 'package:flutter/material.dart';
import 'package:supapay/features/home/views/home_screen.dart';
import 'package:supapay/features/signup/views/otp.dart';
import 'package:supapay/features/signup/views/phone_verification.dart';
import 'package:supapay/features/signup/views/signup.dart';
import 'package:supapay/features/welcome/views/welcome1.dart';

Map<String, WidgetBuilder> get routes {
    return {
      '/welcome':(context) => const Welcome1(),
      '/signup':(context) => const Signup(),
      '/phone-verification':(context) => const PhoneVerification(),
      '/otp':(context) => const OTP(),
      '/home':(context) => const Home(),
      };
  }