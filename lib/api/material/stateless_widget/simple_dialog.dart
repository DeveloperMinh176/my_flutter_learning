import 'package:flutter/material.dart';

Widget mySimpleDialog() => SimpleDialog(
      title: Text('abc'),
      children: [
        SimpleDialogOption(
          child: Text('abc'),
          onPressed: () {},
        ),
        SimpleDialogOption(
          child: Text('abc'),
          onPressed: () {},
        )
      ],
    );
