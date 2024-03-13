import 'package:flutter/material.dart';
import 'package:flutter_learn/beyond_ui/serialization/background_parsing.dart';
import 'package:flutter_learn/ui/interactivity/gestures/handling_taps.dart';

import 'beyond_ui/persistence/key_value.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Demo';
    return MaterialApp(
      home: KeyValue(title: title),
    );
  }
}
