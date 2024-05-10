import 'package:flutter/cupertino.dart';

void myShowCupertinoDialog(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text('abc'),
            content: Text('abc'),
            actions: [
              CupertinoDialogAction(
                child: Text('No'),
                onPressed: () {},
                isDefaultAction: true,
                isDestructiveAction: true,
              )
            ],
          ));
}
