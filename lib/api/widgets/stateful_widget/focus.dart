import 'package:flutter/widgets.dart';

final myFocus = Focus(
  autofocus: true,
  onKey: (node, event) => KeyEventResult.handled,
  onKeyEvent: (node, event) => KeyEventResult.ignored,
  canRequestFocus: true,
  debugLabel: 'abc',
  onFocusChange: (value) {},
  child: Container(),
);
