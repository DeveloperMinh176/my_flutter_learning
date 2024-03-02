import 'package:flutter/material.dart';

final myDropdownButton = DropdownButton(
    value: 3,
    style: TextStyle(color: Colors.amber),
    isExpanded: true,
    icon: Icon(Icons.abc),
    iconSize: 30,
    iconEnabledColor: Colors.amber,
    underline: Container(height: 2, color: Colors.amber),
    onChanged: (_) {},
    elevation: 20,
    items: [
      DropdownMenuItem(
        value: 3,
        child: Text('acb'),
      )
    ]);
