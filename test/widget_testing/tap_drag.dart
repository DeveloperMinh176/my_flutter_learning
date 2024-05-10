import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Add and remove a todo', (tester) async {
    await tester.pumpWidget(const Todo());
    await tester.enterText(find.byType(TextField), 'Hi');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('Hi'), findsOneWidget);
    await tester.drag(find.byType(Dismissible), Offset(500, 0));
    await tester.pumpAndSettle();
    expect(find.text('Hi'), findsNothing);
  });
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final TextEditingController controller = TextEditingController();
  final todos = <String>[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('T')),
      body: Center(
        child: Column(children: [
          TextField(
            controller: controller,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Dismissible(
                  key: Key('$todo$index'),
                  child: ListTile(title: Text('$todo')),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) => todos.removeAt(index),
                );
              },
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todos.add(controller.text);
            controller.clear();
          });
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
