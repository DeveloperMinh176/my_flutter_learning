import 'package:flutter/cupertino.dart';

enum sky { a, b, c }

final myCupertinoSegmentedControl = CupertinoSegmentedControl(
    selectedColor: CupertinoColors.activeBlue,
    padding: EdgeInsets.symmetric(horizontal: 20),
    groupValue: sky.a,
    onValueChanged: (value) {},
    children: {
      sky.a: Text('abc'),
      sky.b: Text('abc'),
      sky.c: Text('abc'),
    });
