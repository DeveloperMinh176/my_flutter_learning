import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds a Text widget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: Text('H')),
    ));
    expect(find.text('H'), findsOneWidget);
  });
  testWidgets('finds a widget using a Key', (tester) async {
    final testKey = Key('K');
    await tester.pumpWidget(MaterialApp(
      key: testKey,
      home: Container(),
    ));
    expect(find.byKey(testKey), findsOneWidget);
  });
  testWidgets('finds a specific instance', (tester) async {
    final childWidget = Padding(
      padding: EdgeInsets.all(8),
    );
    await tester.pumpWidget(Container(
      child: childWidget,
    ));
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
