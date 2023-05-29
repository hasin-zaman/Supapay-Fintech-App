import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    Key? key,
  }) : super(key: key);

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
            cardNumber: '5339402848724984',
            expiryDate: '12/26',
            cardHolderName: 'Username',
            cvvCode: '571',
            showBackView: false,
          ),
          const ListTile(
            leading: Icon(Icons.atm_rounded),
            title: Text("Show ATMs"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
    );
  }
}
