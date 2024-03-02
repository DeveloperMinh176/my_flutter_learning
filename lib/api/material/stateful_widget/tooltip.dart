import 'package:flutter/material.dart';

final myTooltip = Tooltip(
  key: null,
  triggerMode: TooltipTriggerMode.manual,
  height: 60,
  padding: EdgeInsets.all(6),
  message: 'abc',
  richMessage: TextSpan(),
  showDuration: Duration(seconds: 2),
  waitDuration: Duration(seconds: 3),
  preferBelow: true,
  verticalOffset: 20,
  textStyle: TextStyle(),
  decoration: BoxDecoration(),
  child: null,
);
