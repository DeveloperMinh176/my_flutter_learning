import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      Container(width: 160, color: Colors.red),
      Container(width: 160, color: Colors.green),
      Container(width: 160, color: Colors.yellow),
      Container(width: 160, color: Colors.blue),
      Container(width: 160, color: Colors.orange),
    ]);
  }
}
