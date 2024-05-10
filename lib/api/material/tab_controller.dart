import 'package:flutter/material.dart';

class MyTabController extends State<StatefulWidget>
    with TickerProviderStateMixin {
  late TabController myTabController = TabController(
    initialIndex: 2,
    length: 3,
    vsync: this,
  );

  final myDefaultTabController =
      DefaultTabController(initialIndex: 1, length: 3, child: Container());

  @override
  Widget build(BuildContext context) {
    myTabController.index = 2;
    // TODO: implement build
    throw UnimplementedError();
  }
}

final myTab = Tab(icon: Icon(Icons.abc));

final myTabBarView = TabBarView(
  children: [],
  controller: null,
);
