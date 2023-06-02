// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinput/pinput.dart';
import 'package:supapay/features/atmsInfo/views/atm_screen.dart';
import 'package:supapay/features/customer_support/views/support_page.dart';
import 'package:supapay/features/home/models/user_model.dart';
import 'package:supapay/features/home/views/card_page.dart';
import 'package:supapay/features/home/views/profile_page.dart';
import 'package:supapay/features/login/views/otp.dart';
import 'package:supapay/features/signup/components/progress_indicator.dart';
import 'package:supapay/features/signup/views/otp.dart';
import 'package:supapay/features/welcome/views/welcome1.dart';
import 'package:supapay/features/qr_code/views/qr_screen.dart';
import 'package:supapay/global/components/pin_code.dart';
import 'package:supapay/global/components/text_field.dart';
import 'package:supapay/global/components/view_heading.dart';
import 'package:supapay/global/components/view_sub_heading.dart';

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

  group('ATMs Info', () {
    testWidgets(
      'ATMs Info Map',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: ATMInfo(),
        ));
        expect(find.text("Show ATMs"), findsOneWidget);
        expect(find.byKey(const Key('maps')), findsOneWidget);
        expect(find.byKey(const Key('loader')), findsOneWidget);
      },
    );
  });

  group('ViewSubHeading Widget', () {
    testWidgets('Renders the heading text correctly',
        (WidgetTester tester) async {
      // Define a test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ViewSubHeading(heading: 'Test Heading'),
          ),
        ),
      );

      // Find the Text widget
      final headingFinder = find.text('Test Heading');

      // Verify that the heading text is rendered
      expect(headingFinder, findsOneWidget);
    });

    testWidgets('Uses the correct text style', (WidgetTester tester) async {
      // Define a test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ViewSubHeading(heading: 'Test Heading'),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(find.byType(Text));

      // Verify the text style properties
      expect(textWidget.style?.fontSize, 20);
      expect(textWidget.style?.fontWeight, FontWeight.w500);
      expect(textWidget.style?.color, Colors.black54);
    });

    testWidgets('Aligns the text to the center', (WidgetTester tester) async {
      // Define a test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ViewSubHeading(heading: 'Test Heading'),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(find.byType(Text));

      // Verify the text alignment property
      expect(textWidget.textAlign, TextAlign.center);
    });
  });
  group('ViewHeading Widget', () {
    testWidgets('Renders the heading text correctly',
        (WidgetTester tester) async {
      // Define a test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ViewHeading(heading: 'Test Heading'),
          ),
        ),
      );

      // Find the Text widget
      final headingFinder = find.text('Test Heading');

      // Verify that the heading text is rendered
      expect(headingFinder, findsOneWidget);
    });

    testWidgets('Uses the correct text style', (WidgetTester tester) async {
      // Define a test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ViewHeading(heading: 'Test Heading'),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(find.byType(Text));

      // Verify the text style properties
      expect(textWidget.style?.fontSize, 30);
      expect(textWidget.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('Aligns the text to the center', (WidgetTester tester) async {
      // Define a test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ViewHeading(heading: 'Test Heading'),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(find.byType(Text));

      // Verify the text alignment property
      expect(textWidget.textAlign, TextAlign.center);
    });
  });

  group('PinCode Widget', () {
    testWidgets('Updates OTP value on input change',
        (WidgetTester tester) async {
      // Define a test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PinCode(length: 6),
          ),
        ),
      );

      // Find the Pinput widget
      final pinputFinder = find.byType(Pinput);

      // Simulate entering a pin code
      await tester.enterText(pinputFinder, '123456');

      // Verify that the OTP value is updated correctly
      expect(OTP.otp, '123456');
      expect(OTPLogin.otp, '123456');
    });
  });

  group("CustomIndicator Check", () {
    testWidgets('CustomProgressIndicator displays correct progress value',
        (WidgetTester tester) async {
      const double progressValue = 0.75;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: CustomProgressIndicator(value: progressValue),
        ),
      ));

      final linearProgressIndicatorFinder =
          find.byType(LinearProgressIndicator);
      final linearProgressIndicatorWidget =
          tester.widget<LinearProgressIndicator>(linearProgressIndicatorFinder);

      expect(linearProgressIndicatorWidget.value, progressValue);
    });

    testWidgets('CustomProgressIndicator has correct colors and height',
        (WidgetTester tester) async {
      const double progressValue = 0.5;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: CustomProgressIndicator(value: progressValue),
        ),
      ));

      final linearProgressIndicatorFinder =
          find.byType(LinearProgressIndicator);
      final linearProgressIndicatorWidget =
          tester.widget<LinearProgressIndicator>(linearProgressIndicatorFinder);

      expect(linearProgressIndicatorWidget.backgroundColor,
          const Color(0xFFCFCFCF));
      expect(linearProgressIndicatorWidget.color, const Color(0xFF1C6758));
      expect(linearProgressIndicatorWidget.minHeight, 4.0);
    });
  });

  group("Check text_field Widget", () {
    testWidgets('CustomTextField displays correct label and hint text',
        (WidgetTester tester) async {
      const String labelText = 'Full Name';
      const String hintText = 'Enter your full name';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            textInputType: TextInputType.text,
            labelText: labelText,
            hintText: hintText,
            obscureText: false,
            controller: TextEditingController(),
          ),
        ),
      ));

      expect(find.text(labelText), findsOneWidget);
      expect(find.text(hintText), findsOneWidget);
    });

    testWidgets('CustomTextField captures user input correctly',
        (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            textInputType: TextInputType.text,
            labelText: 'Full Name',
            hintText: 'Enter your full name',
            obscureText: false,
            controller: controller,
          ),
        ),
      ));

      const String inputText = 'John Wick';
      await tester.enterText(find.byType(TextField), inputText);

      expect(controller.text, inputText);
    });

    testWidgets('CustomTextField obscures text correctly',
        (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            textInputType: TextInputType.text,
            labelText: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            controller: controller,
          ),
        ),
      ));

      const String inputText = '1234';
      await tester.enterText(find.byType(TextField), inputText);

      expect(controller.text, inputText);
    });
  });

  testWidgets('SupportScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SupportScreen()));

    // Verify that the text "How can we help?" is displayed
    expect(find.text('How can we help?'), findsOneWidget);

    // Verify that the "FAQs" ListTile is displayed
    expect(find.widgetWithText(ListTile, 'FAQs'), findsOneWidget);

    // Verify that the "Send us a message" ListTile is displayed
    expect(find.widgetWithText(ListTile, 'Send us a message'), findsOneWidget);

    // Verify that the Icons are displayed
    expect(find.byIcon(Icons.support_agent_rounded), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsNWidgets(2));
  });

  group('CardScreen', () {
    UserModel testUserModel;

    testUserModel = UserModel(
      cardNumber: '1234567890123456',
      expiryDate: '12/24',
      name: 'John Doe',
      cvvCode: '123',
    );

    testWidgets('Renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CardScreen(userData: testUserModel)),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(CreditCardWidget), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text('Show ATMs'), findsOneWidget);
    });

    testWidgets('Navigates to ATMs screen when tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CardScreen(userData: testUserModel)),
        routes: {
          '/home/atms': (context) => Scaffold(
                appBar: AppBar(title: const Text('ATMs')),
                body: const Text('ATMs Screen'),
              ),
        },
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.text('Show ATMs'));
      await tester.pumpAndSettle();

      expect(find.text('ATMs Screen'), findsOneWidget);
    });
  });

  group('ProfileScreen', () {
    UserModel testUserModel;

    testUserModel = UserModel(
      name: 'John Doe',
      accountNumber: '1234567890',
      email: 'johndoe@example.com',
    );

    testWidgets('Renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ProfileScreen(userData: testUserModel)),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Account Number'), findsOneWidget);
      expect(find.text('1234567890'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('johndoe@example.com'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Customer Support'), findsOneWidget);
      expect(find.text('Log Out'), findsOneWidget);
    });

    testWidgets('Navigates to support screen when customer support is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ProfileScreen(userData: testUserModel)),
        routes: {
          '/home/support': (context) => Scaffold(
                appBar: AppBar(title: const Text('Customer Support')),
                body: const Text('Support Screen'),
              ),
        },
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.text('Customer Support'));
      await tester.pumpAndSettle();

      expect(find.text('Support Screen'), findsOneWidget);
    });
  });

}
