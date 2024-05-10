import 'package:flutter/cupertino.dart';

void myCupertinoActionSheet(BuildContext context) {
  showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
            title: Text('abc'),
            message: Text('abc'),
            actions: [
              CupertinoActionSheetAction(
                  child: Text('abc'),
                  onPressed: () {},
                  isDefaultAction: true,
                  isDestructiveAction: true)
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {},
              child: Text('abc'),
            ),
          ));
}
