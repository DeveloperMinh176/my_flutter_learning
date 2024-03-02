import 'package:flutter/material.dart';

final mySegmentedButton = SegmentedButton(
  segments: [
    ButtonSegment(value: Text('abc'), icon: Icon(Icons.abc), label: Text('abc'))
  ],
  selected: {},
  onSelectionChanged: (_) {},
  multiSelectionEnabled: true,
);
