import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../models/user_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    Key? key, required this.userData,
  }) : super(key: key);

  final User userData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CreditCardWidget(
            onCreditCardWidgetChange: (brand) {},
            isSwipeGestureEnabled: true,
            isHolderNameVisible: true,
            obscureCardCvv: false,
            obscureCardNumber: false,
            obscureInitialCardNumber: false,
            glassmorphismConfig: Glassmorphism(
              blurX: 5.0,
              blurY: 5.0,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            cardNumber: userData.cardNumber!,
            expiryDate: userData.expiryDate!,
            cardHolderName: userData.name!,
            cvvCode: userData.cvvCode!,
            showBackView: false,
          ),
          ListTile(
            leading: const Icon(Icons.atm_rounded),
            title: const Text("Show ATMs"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.pushNamed(context, '/home/atms');
            },
          )
        ],
      ),
    );
  }
}
