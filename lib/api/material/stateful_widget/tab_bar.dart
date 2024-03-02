import 'package:flutter/material.dart';

final myTabBar = TabBar(
  tabs: [],
  controller: null,
  isScrollable: true,
  indicatorColor: Colors.amber,
  indicatorWeight: 20,
  indicatorSize: TabBarIndicatorSize.tab,
  labelColor: Colors.amber,
  unselectedLabelColor: Colors.amber,
  labelStyle: TextStyle(),
  unselectedLabelStyle: TextStyle(),
  tabAlignment: TabAlignment.startOffset,
);

final myTabBarSecondary = TabBar.secondary(
  tabs: [],
  controller: null,
  isScrollable: true,
  indicatorColor: Colors.amber,
  indicatorWeight: 20,
  indicatorSize: TabBarIndicatorSize.tab,
  labelColor: Colors.amber,
  unselectedLabelColor: Colors.amber,
  labelStyle: TextStyle(),
  unselectedLabelStyle: TextStyle(),
  tabAlignment: TabAlignment.startOffset,
);
