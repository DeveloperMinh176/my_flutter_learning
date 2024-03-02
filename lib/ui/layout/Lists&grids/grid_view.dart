import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(
            100,
            (index) => Center(
                  child: Text('Item $index',
                      style: Theme.of(context).textTheme.headlineSmall),
                )));
  }
}
