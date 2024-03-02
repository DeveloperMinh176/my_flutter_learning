import 'package:flutter/material.dart';

final myFilterChip = FilterChip(
  selected: true,
  onSelected: (value) {},
  label: Text('abc'),
);

final myFilterChipElevated = FilterChip.elevated(
  selected: true,
  onSelected: (value) {},
  label: Text('abc'),
);
