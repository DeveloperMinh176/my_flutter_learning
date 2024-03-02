import 'package:flutter/widgets.dart';

final myDismissible = Dismissible(
  key: ValueKey(3),
  onDismissed: (DismissDirection direction) {},
  background: Container(color: Color(0xFFF7F7F7)),
  child: Container(),
);
