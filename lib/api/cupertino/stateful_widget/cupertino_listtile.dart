import 'package:flutter/cupertino.dart';

final myCupertinoListTile = CupertinoListTile(
    leading: Icon(CupertinoIcons.share),
    trailing: Icon(CupertinoIcons.heart),
    title: Text('abc'),
    additionalInfo: Text('abc'),
    onTap: () {});
