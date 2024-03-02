import 'package:flutter/widgets.dart';

final myFocusScope = FocusScope(
  autofocus: true,
  onKey: (node, event) => KeyEventResult.handled,
  debugLabel: 'abc',
  onFocusChange: (value) {},
  child: Container(),
);
