import 'package:flutter/widgets.dart';

final mySliverList = SliverList(
  delegate: SliverChildBuilderDelegate((context, index) => null),
);

final mySliverListBuilder = SliverList.builder(
  itemBuilder: (context, index) => null,
  itemCount: 2,
  addAutomaticKeepAlives: true,
);

final mySliverListList = SliverList.list(
  children: [],
  addAutomaticKeepAlives: true,
);

final mySliverListSeparated = SliverList.separated(
  itemBuilder: (context, index) => null,
  itemCount: 2,
  separatorBuilder: (context, index) => null,
  addAutomaticKeepAlives: true,
);
