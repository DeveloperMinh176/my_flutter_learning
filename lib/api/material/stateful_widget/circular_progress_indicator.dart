import 'package:flutter/material.dart';

final myCircularProgressIndicator = CircularProgressIndicator(
  backgroundColor: Colors.amber,
  valueColor: AlwaysStoppedAnimation(Colors.amber),
  strokeWidth: 10,
  value: null,
  semanticsLabel: 'abc',
);
