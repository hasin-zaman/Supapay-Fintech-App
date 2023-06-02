import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:supapay/features/sendFunds/views/send_funds_page.dart';

void main() {
  testGoldens('MyApp screenshot test', (WidgetTester tester) async {
    // Build your app's UI
    await tester.pumpWidget(MaterialApp(
      home: SendFundsPage(),
    ));
    // Prepare the widget for screenshot testing
    await screenMatchesGolden(tester, 'my_app_welcome2');
  });
}
