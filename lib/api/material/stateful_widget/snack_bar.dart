import 'package:flutter/material.dart';

final snackBar = SnackBar(
    content: Text('abc'),
    action: SnackBarAction(
      label: 'abc',
      onPressed: () {},
    ),
    padding: EdgeInsets.all(6),
    duration: Duration(milliseconds: 1000),
    behavior: SnackBarBehavior.floating,
    width: 120,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));
