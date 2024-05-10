import 'package:flutter/material.dart';

final myNavigationRail = NavigationRail(
  destinations: [
    NavigationRailDestination(
      label: Text('abc'),
      icon: Icon(Icons.abc),
      selectedIcon: Icon(Icons.abc),
    ),
  ],
  onDestinationSelected: (value) {},
  selectedIndex: 3,
  extended: true,
  indicatorColor: Colors.amber,
  backgroundColor: Colors.amber,
  labelType: NavigationRailLabelType.all,
  leading: Icon(Icons.abc),
  trailing: Icon(Icons.abc),
  elevation: 3,
  selectedLabelTextStyle: TextStyle(),
  unselectedLabelTextStyle: TextStyle(),
  minWidth: 10,
  useIndicator: true,
  groupAlignment: -1,
);
