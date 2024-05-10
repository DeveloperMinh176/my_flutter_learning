import 'package:flutter/material.dart';
import 'package:flutter_learn/ui/layout/Lists&grids/long_lists.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds a deep item in a long list', (tester) async {
    await tester.pumpWidget(MyList(
      items: List<String>.generate(1000, (index) => 'Item $index'),
    ));

    final itemFinder = find.byKey(ValueKey('item_50_text'));
    final listFinder = find.byType(Scrollable);

    await tester.scrollUntilVisible(
      itemFinder,
      500,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });
}
