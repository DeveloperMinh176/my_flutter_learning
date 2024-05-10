import 'package:flutter/cupertino.dart';

final myCupertinoSliverNavigationBar = CupertinoSliverNavigationBar(
    middle: Text('abc'),
    largeTitle: Text('abc'),
    leading: Icon(CupertinoIcons.person_2),
    trailing: Icon(CupertinoIcons.add_circled),
    backgroundColor: CupertinoColors.systemYellow,
    border: Border(bottom: BorderSide(color: CupertinoColors.black)));
