import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:supapay/features/forgot_pin/views/change_pin.dart';
import 'package:supapay/features/login/views/login.dart';

class PassCode extends StatelessWidget {
  const PassCode({Key? key, this.validator}) : super(key: key);

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
        pinputAutovalidateMode: PinputAutovalidateMode.disabled,
        obscureText: true,
        showCursor: true,
        forceErrorState: true,
        validator: validator,
        onChanged: (value) {
          Login.code=value;
          ChangePIN.code=value;
        }
    );
  }
}
