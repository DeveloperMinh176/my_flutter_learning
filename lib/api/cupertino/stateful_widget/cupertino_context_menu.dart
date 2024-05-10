import 'package:flutter/cupertino.dart';

final myCupertinoContextMenu = CupertinoContextMenu(
  actions: [
    CupertinoContextMenuAction(
      child: Text('abc'),
      onPressed: () {},
      isDefaultAction: true,
      isDestructiveAction: true,
      trailingIcon: CupertinoIcons.add,
    )
  ],
  child: Text('abc'),
);

final myCupertinoContextMenuBuilder = CupertinoContextMenu.builder(
  actions: [
    CupertinoContextMenuAction(
      child: Text('abc'),
      onPressed: () {},
      isDefaultAction: true,
      isDestructiveAction: true,
      trailingIcon: CupertinoIcons.add,
    )
  ],
  builder: (context, animation) {
    return Text('abc');
  },
);
