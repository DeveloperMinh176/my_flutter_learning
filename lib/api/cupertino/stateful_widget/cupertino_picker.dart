import 'package:flutter/cupertino.dart';

final myCupertinoPicker = CupertinoPicker(
    magnification: 1.2,
    squeeze: 1,
    useMagnifier: true,
    itemExtent: 20,
    onSelectedItemChanged: (value) {},
    scrollController: FixedExtentScrollController(initialItem: 0),
    children: []);
