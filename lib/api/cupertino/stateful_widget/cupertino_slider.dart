import 'package:flutter/cupertino.dart';

final myCupertinoSlider = CupertinoSlider(
  key: Key('abc'),
  value: 30,
  divisions: 100,
  max: 200,
  thumbColor: CupertinoColors.black,
  activeColor: CupertinoColors.black,
  onChangeStart: (value) {},
  onChangeEnd: (value) {},
  onChanged: (value) {},
);
