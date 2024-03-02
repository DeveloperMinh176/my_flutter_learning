import 'package:flutter/widgets.dart';

final mySliverChildBuilderDelegate = SliverChildBuilderDelegate(
  (context, index) {},
  addAutomaticKeepAlives: true,
  childCount: 2,
  semanticIndexCallback: (widget, localIndex) {
    if (localIndex.isEven) return localIndex ~/ 2;
  },
  semanticIndexOffset: 2,
);
