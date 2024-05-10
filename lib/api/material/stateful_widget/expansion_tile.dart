import 'package:flutter/material.dart';

final myExpansionTile = ExpansionTile(
  title: Text('abc'),
  subtitle: Text('abc'),
  children: [],
  onExpansionChanged: (value) {},
  controlAffinity: ListTileControlAffinity.platform,
  trailing: Icon(Icons.abc),
);

//ExpansionTileController.of(context).expand();
//ExpansionTileController.of(context).collapse();