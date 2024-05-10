import 'package:flutter/material.dart';
import 'package:flutter_learn/beyond_ui/testing_debugging/introduction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', (() {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      await tester.pumpWidget(Introduction());

      expect(find.text('0'), findsOneWidget);
      final tap = find.byKey(Key('increment'));
      await tester.tap(tap);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
  }));
}
