import 'package:flutter/material.dart';

Future myShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text('abc'),
            content: Text('xyz'),
            actions: [TextButton(onPressed: null, child: Text('abc'))],
            shape: CircleBorder(),
            backgroundColor: Colors.amber,
            elevation: 20,
          ),
      barrierDismissible: true);
}

final myDialog = Dialog(
  child: null,
);
