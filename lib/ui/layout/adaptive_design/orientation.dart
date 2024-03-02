import 'package:flutter/material.dart';

class MyOrientation extends StatelessWidget {
  final String title;
  const MyOrientation({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(
                100,
                (index) => Center(
                        child: Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.displayMedium,
                    ))),
          );
        },
      ),
    );
  }
}
