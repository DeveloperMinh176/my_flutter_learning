import 'package:flutter/material.dart';

final myNavigationDrawer = NavigationDrawer(
  children: [],
  onDestinationSelected: (value) {},
  selectedIndex: 1,
);

final myNavigationDrawerDestination = NavigationDrawerDestination(
  icon: Icon(Icons.abc),
  label: Text("abc"),
  selectedIcon: Icon(Icons.abc),
);
