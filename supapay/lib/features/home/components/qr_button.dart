import 'package:flutter/material.dart';

import '../models/user_model.dart';

class QRCodeButton extends StatelessWidget {
  const QRCodeButton({
    Key? key, required this.userData,
  }) : super(key: key);

  final String userData;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home/qr', arguments: userData);
      },
      tooltip: "Scan Code",
      child: const Icon(Icons.qr_code_scanner_rounded),
    );
  }
}