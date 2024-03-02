import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final myTextField = TextField(
  autofocus: true,
  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
  focusNode: FocusNode(),
  obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'abc',
    prefix: Icon(Icons.abc),
    suffix: Icon(Icons.abc),
    prefixIcon: Icon(Icons.abc),
    prefixIconColor: Colors.amber,
    icon: Icon(Icons.abc),
    hintText: 'q',
    helperText: 'abc',
    counterText: 'abc',
    filled: true,
  ),
  onSubmitted: (value) {},
  onChanged: (value) {},
  controller: TextEditingController(),
);
