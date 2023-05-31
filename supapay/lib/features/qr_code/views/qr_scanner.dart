import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:supapay/global/validators.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      fit: BoxFit.scaleDown,
      // fit: BoxFit.contain,
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        facing: CameraFacing.back,
        torchEnabled: false,
      ),
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        String value= '';
        for (final barcode in barcodes) {
          debugPrint('${barcode.type}');
          debugPrint('Barcode found! ${barcode.rawValue}');
          if (barcode.rawValue.toString().isMobileNumberValid()) {
              value = barcode.rawValue.toString();
              break;
          }
        }
          Navigator.popAndPushNamed(context, '/home/sendFunds', arguments: value);
      },
    );
  }
}
