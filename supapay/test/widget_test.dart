// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supapay/features/welcome/views/welcome1.dart';
import 'package:supapay/features/qr_code/views/qr_screen.dart';

void main() {
  testWidgets('Test Welcome Pages', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Welcome1()));
    expect(find.text('Welcome to Supapay!'), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text("Connect All Wallets!"), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text("Get Started!"), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
  });

  testWidgets('QR Code', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: QRScreen()));
    expect(find.byKey(const Key('qr-code')), findsOneWidget);
    expect(find.text("Scan Code"), findsOneWidget);
    await tester.tap(find.text("Scan Code"));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('qr-scanner')), findsOneWidget);
  });
}
