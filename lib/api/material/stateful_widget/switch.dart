import 'package:flutter/material.dart';

final mySwitch = Switch(
    activeColor: Colors.amber,
    value: true,
    onChanged: (value) {},
    overlayColor: MaterialStatePropertyAll(Colors.black),
    trackColor: MaterialStatePropertyAll(Colors.black),
    thumbIcon: MaterialStatePropertyAll(
      Icon(Icons.abc),
    ),
    thumbColor: MaterialStatePropertyAll(Colors.black));

final mySwitchAdaptive = Switch.adaptive(
    applyCupertinoTheme: true,
    activeColor: Colors.amber,
    value: true,
    onChanged: (value) {},
    overlayColor: MaterialStatePropertyAll(Colors.black),
    trackColor: MaterialStatePropertyAll(Colors.black),
    thumbIcon: MaterialStatePropertyAll(
      Icon(Icons.abc),
    ),
    thumbColor: MaterialStatePropertyAll(Colors.black));
