import 'package:flutter/material.dart';

final myChoiceChip = ChoiceChip(
  selected: true,
  onSelected: (value) {},
  label: Text('abc'),
);

final myChoiceChipElevated = ChoiceChip.elevated(
  label: Text('abc'),
  selected: true,
  onSelected: (bool a) {},
);
