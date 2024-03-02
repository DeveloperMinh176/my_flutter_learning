import 'package:flutter/widgets.dart';

final mySliverGridView = SliverGrid(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  delegate: SliverChildListDelegate([]),
);

final mySliverGridViewBuilder = SliverGrid.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  itemBuilder: (context, index) => null,
  itemCount: 3,
  addAutomaticKeepAlives: true,
);

final mySliverGridViewCount = SliverGrid.count(
    children: [],
    mainAxisSpacing: 3,
    crossAxisCount: 3,
    crossAxisSpacing: 3,
    childAspectRatio: 1);

final mySliverGridViewExtent = SliverGrid.extent(
    children: [],
    mainAxisSpacing: 3,
    maxCrossAxisExtent: 3,
    crossAxisSpacing: 3,
    childAspectRatio: 1);
