import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:supapay/main.dart';

void main() {
  testGoldens('MyApp screenshot test', (WidgetTester tester) async {
     // Build your app's UI
      await tester.pumpWidget(const MyApp());
      // Prepare the widget for screenshot testing
      await screenMatchesGolden(tester, 'my_app_screenshot2');
  });
}
