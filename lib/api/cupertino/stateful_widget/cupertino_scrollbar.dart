import 'package:flutter/cupertino.dart';

final myCupertinoScrollbar = CupertinoScrollbar(
  thumbVisibility: true,
  thicknessWhileDragging: 20,
  thickness: 10,
  radius: Radius.circular(5),
  radiusWhileDragging: Radius.zero,
  controller: ScrollController(),
  child: ListView(),
);
