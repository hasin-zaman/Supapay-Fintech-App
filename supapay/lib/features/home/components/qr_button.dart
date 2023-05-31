import 'package:flutter/material.dart';

class QRCodeButton extends StatelessWidget {
  const QRCodeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home/qr');
      },
      tooltip: "Scan Code",
      child: const Icon(Icons.qr_code_scanner_rounded),
    );
  }
}