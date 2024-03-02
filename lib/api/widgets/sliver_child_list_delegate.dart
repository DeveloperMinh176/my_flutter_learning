import 'package:flutter/widgets.dart';

final mySliverChildListDelegate = SliverChildListDelegate(
  [],
  addAutomaticKeepAlives: true,
  semanticIndexCallback: (widget, localIndex) {
    if (localIndex.isEven) return localIndex ~/ 2;
  },
  semanticIndexOffset: 2,
);
