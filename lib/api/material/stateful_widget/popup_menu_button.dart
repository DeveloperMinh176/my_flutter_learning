import 'package:flutter/material.dart';

final myPopupMenuButton = PopupMenuButton<int>(
    initialValue: 3,
    onSelected: (_) {},
    itemBuilder: (context) {
      return [
        PopupMenuItem(child: Text('abc'), value: 3),
        PopupMenuDivider(),
        PopupMenuItem(child: Text('abc'), value: 3),
      ];
    },
    icon: Icon(Icons.abc));
