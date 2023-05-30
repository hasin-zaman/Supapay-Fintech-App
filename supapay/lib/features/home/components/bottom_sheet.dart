import 'package:flutter/material.dart';

Future<dynamic> bottomSheetMore(BuildContext context) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.payments_rounded),
              title: Text('Bill Payments'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(Icons.handshake_rounded),
              title: Text('Micro-loans'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      );
    },
  );
}
