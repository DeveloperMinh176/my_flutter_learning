import 'package:flutter/cupertino.dart';

final myCupertinoTabScaffold = CupertinoTabScaffold(
  tabBar: CupertinoTabBar(items: []),
  tabBuilder: (context, index) {
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(child: Text('abc'));
      },
    );
  },
);
