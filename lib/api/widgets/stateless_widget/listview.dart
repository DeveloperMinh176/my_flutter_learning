import 'package:flutter/material.dart';

// 13 14 15 13
final myListView = ListView(
  scrollDirection: Axis.vertical,
  reverse: true,
  padding: EdgeInsets.all(8),
  clipBehavior: Clip.hardEdge,
  primary: true,
  physics: NeverScrollableScrollPhysics(),
  addAutomaticKeepAlives: true,
  controller: ScrollController(),
  cacheExtent: 150,
  shrinkWrap: true,
  prototypeItem: null,
  itemExtent: 140,
  children: [],
  semanticChildCount: 3,
);

final myListViewBuilder = ListView.builder(
  scrollDirection: Axis.vertical,
  reverse: true,
  padding: EdgeInsets.all(8),
  clipBehavior: Clip.hardEdge,
  primary: true,
  physics: NeverScrollableScrollPhysics(),
  addAutomaticKeepAlives: true,
  controller: ScrollController(),
  cacheExtent: 150,
  prototypeItem: null,
  shrinkWrap: true,
  itemExtent: 140,
  itemCount: 300,
  itemBuilder: (context, index) {},
  semanticChildCount: 3,
);

final myListViewCustom = ListView.custom(
  scrollDirection: Axis.vertical,
  reverse: true,
  padding: EdgeInsets.all(8),
  clipBehavior: Clip.hardEdge,
  primary: true,
  physics: NeverScrollableScrollPhysics(),
  controller: ScrollController(),
  cacheExtent: 150,
  shrinkWrap: true,
  prototypeItem: null,
  itemExtent: 140,
  semanticChildCount: 3,
  childrenDelegate: SliverChildListDelegate([]),
);

final myListViewSeparated = ListView.separated(
  scrollDirection: Axis.vertical,
  reverse: true,
  padding: EdgeInsets.all(8),
  clipBehavior: Clip.hardEdge,
  primary: true,
  physics: NeverScrollableScrollPhysics(),
  addAutomaticKeepAlives: true,
  controller: ScrollController(),
  shrinkWrap: true,
  cacheExtent: 150,
  itemCount: 300,
  itemBuilder: (context, index) {},
  separatorBuilder: (context, index) {
    return Divider();
  },
);
