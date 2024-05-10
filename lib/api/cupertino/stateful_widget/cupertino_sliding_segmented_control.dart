import 'package:flutter/cupertino.dart';

enum sky { a, b, c }

final myCupertinoSlidingSegmentedControl = CupertinoSlidingSegmentedControl(
    backgroundColor: CupertinoColors.black,
    thumbColor: CupertinoColors.activeBlue,
    padding: EdgeInsets.symmetric(horizontal: 20),
    groupValue: sky.a,
    onValueChanged: (value) {},
    children: {
      sky.a: Text('abc'),
      sky.b: Text('abc'),
      sky.c: Text('abc'),
    });
