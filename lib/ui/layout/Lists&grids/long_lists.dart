import 'package:flutter/material.dart';

class LongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyList(items: List<String>.generate(1000, (index) => 'Item $index'));
  }
}

class MyList extends StatelessWidget {
  final List<String> items;

  const MyList({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      prototypeItem: ListTile(title: Text(items.first)),
      itemBuilder: (context, index) => ListTile(title: Text(items[index])),
    );
  }
}
