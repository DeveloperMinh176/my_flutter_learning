import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(const MyWidget());
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');
    expect(titleFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('T')),
            body: Center(
              child: Text('M'),
            )));
  }
}
