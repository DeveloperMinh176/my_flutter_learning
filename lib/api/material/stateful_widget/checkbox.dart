import 'package:flutter/material.dart';

final myCheckBox = Checkbox(
    value: true,
    tristate: true,
    onChanged: (value) {},
    fillColor: MaterialStatePropertyAll(Colors.amber),
    checkColor: Colors.amber,
    isError: true);

final myCheckBoxAdaptive = Checkbox.adaptive(
    value: true,
    tristate: true,
    onChanged: (value) {},
    fillColor: MaterialStatePropertyAll(Colors.amber),
    checkColor: Colors.amber,
    isError: true);
