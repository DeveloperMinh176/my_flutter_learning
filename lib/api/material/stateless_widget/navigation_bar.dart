import 'package:flutter/material.dart';

final myNavigationBar = NavigationBar(
  onDestinationSelected: (_) {},
  selectedIndex: 3,
  destinations: [],
  indicatorColor: Colors.amber,
  backgroundColor: Colors.amber,
  animationDuration: Duration(seconds: 3),
  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
);

final myNavigationDestination = NavigationDestination(
  label: 'abc',
  icon: Icon(Icons.abc),
  selectedIcon: Icon(Icons.abc),
);
