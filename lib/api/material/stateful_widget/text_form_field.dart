import 'package:flutter/material.dart';

final myTextFormField = TextFormField(
  controller: TextEditingController(),
  onSaved: (value) {
    debugPrint('value');
  },
  onChanged: (value) {},
  decoration: InputDecoration(),
  validator: (value) {},
);
