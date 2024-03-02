import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
          title: Text('Floating App Bar'),
          floating: true,
          flexibleSpace: Placeholder(),
          expandedHeight: 200),
      SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: 1000,
              (context, index) => ListTile(title: Text('Item #$index'))))
    ]);
  }
}
