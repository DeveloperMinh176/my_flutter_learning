import 'package:flutter/material.dart';

final myMenuBar = MenuBar(
  children: [],
);
final myMenuAnchor = MenuAnchor(
  childFocusNode: FocusNode(),
  menuChildren: [
    MenuItemButton(
      child: null,
      onPressed: () {},
      shortcut: null,
    ),
    SubmenuButton(
      menuChildren: [
        MenuItemButton(
          child: null,
          onPressed: null,
          shortcut: null,
        )
      ],
      child: Text('abc'),
    )
  ],
  builder: (context, controller, child) {
    return GestureDetector(
      onTap: () {},
      child: child,
    );
  },
  child: Text('abc'),
);

class Ges {}
