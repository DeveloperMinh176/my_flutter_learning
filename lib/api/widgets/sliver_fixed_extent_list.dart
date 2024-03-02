import 'package:flutter/widgets.dart';

final mySliverFixedExtentList = SliverFixedExtentList(
  delegate: SliverChildListDelegate([]),
  itemExtent: 20,
);
final mySliverFixedExtentListBuilder = SliverFixedExtentList.builder(
  itemBuilder: (context, index) => null,
  itemCount: 30,
  addAutomaticKeepAlives: true,
  itemExtent: 20,
);

final mySliverFixedExtentListList = SliverFixedExtentList.list(
  children: [],
  addAutomaticKeepAlives: true,
  itemExtent: 20,
);
