import 'package:flutter/material.dart';

final myDropdownMenu = DropdownMenu(
    controller: TextEditingController(),
    initialSelection: 3,
    leadingIcon: Icon(Icons.abc),
    label: Text('abc'),
    requestFocusOnTap: true,
    enableFilter: true,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.amber,
      contentPadding: EdgeInsets.all(5),
    ),
    dropdownMenuEntries: [
      DropdownMenuEntry(
        value: 3,
        label: 'abc',
        leadingIcon: Icon(Icons.abc),
        enabled: true,
        style: MenuItemButton.styleFrom(foregroundColor: Colors.amber),
      ),
    ]);
