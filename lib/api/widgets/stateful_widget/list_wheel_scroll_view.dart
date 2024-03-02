import 'package:flutter/widgets.dart';

final myListWheelScrollView = ListWheelScrollView(
  controller: ScrollController(),
  physics: null,
  itemExtent: 120,
  clipBehavior: Clip.antiAlias,
  children: [],
  diameterRatio: 10,
  offAxisFraction: 10,
  magnification: 2,
  useMagnifier: true,
  scrollBehavior: null,
);
