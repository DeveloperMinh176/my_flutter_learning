import 'package:flutter/material.dart';

final myElevatedButton = ElevatedButton(
  onPressed: () {},
  child: Text('abc'),
  style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
    (states) => Colors.amber,
  )),
);

final myFilledButton = FilledButton(
  onPressed: () {},
  child: Text('abc'),
  style: TextButton.styleFrom(foregroundColor: Colors.amber),
);

final myFilledButtonTonal = FilledButton.tonal(
  onPressed: () {},
  child: Text('abc'),
  style: TextButton.styleFrom(),
);

final myOutlinedButton = OutlinedButton(
  onPressed: () {},
  child: Text('abc'),
  style: TextButton.styleFrom(),
);

final myOutlinedButtonIcon = OutlinedButton.icon(
  onPressed: () {},
  label: Text('abc'),
  icon: Icon(Icons.abc),
  style: TextButton.styleFrom(),
);

final myTextButton = TextButton(
  onPressed: () {},
  child: Text('abc'),
  style: TextButton.styleFrom(),
);
