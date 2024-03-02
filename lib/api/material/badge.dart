import 'package:flutter/material.dart';

final myBadge = Badge(
  label: Text('abc'),
  child: Icon(Icons.abc),
);

final myBadgeCount = Badge.count(
  count: 3,
  child: Icon(Icons.abc),
);
