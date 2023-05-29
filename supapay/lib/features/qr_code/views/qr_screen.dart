import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supapay/features/qr_code/components/app_bar.dart';
import 'package:supapay/features/qr_code/views/qr_scanner.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).textTheme.bodyText1?.color;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(color),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: QrImage(
                foregroundColor: color,
                padding: const EdgeInsets.all(40.0),
                data: "03110887898",
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
            const ScanQrPage()
          ],
        ),
      ),
    );
  }
}
