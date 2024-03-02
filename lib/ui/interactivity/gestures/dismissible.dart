import 'package:flutter/material.dart';

class MyDismissible extends StatefulWidget {
  final String title;

  MyDismissible({super.key, required this.title});

  @override
  State<MyDismissible> createState() => _MyDismissibleState();
}

class _MyDismissibleState extends State<MyDismissible> {
  final items = List<String>.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              child: ListTile(title: Text(item)),
              background: Container(
                color: Colors.red,
              ),
              key: ValueKey(items[index]),
              onDismissed: (direction) {
                setState(() => items.removeAt(index));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$item dismissed'),
                ));
              },
            );
          }),
    );
  }
}
