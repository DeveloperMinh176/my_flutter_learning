import 'package:flutter/material.dart';

final myListTile = ListTile(
  leading: Icon(Icons.abc),
  title: Text("abc"),
  subtitle: Text("xyz"),
  trailing: Icon(Icons.abc),
  isThreeLine: true,
  dense: true,
  selected: true,
  selectedColor: Colors.amber,
  selectedTileColor: Colors.amber,
  enabled: true,
  iconColor: Colors.amber,
  textColor: Colors.amber,
  onTap: null,
  titleTextStyle: TextStyle(),
  subtitleTextStyle: TextStyle(),
  minVerticalPadding: 20,
  titleAlignment: ListTileTitleAlignment.threeLine,
  tileColor: Colors.amber,
);
