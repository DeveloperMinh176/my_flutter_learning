import 'package:flutter/material.dart';

final myScrollBar = Scrollbar(
  child: ListView(),
  thumbVisibility: true,
  trackVisibility: true,
  radius: Radius.circular(8),
  controller: ScrollController(),
  notificationPredicate: null,
  thickness: 20,
);
