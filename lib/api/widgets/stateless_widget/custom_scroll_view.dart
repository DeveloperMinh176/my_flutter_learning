import 'package:flutter/widgets.dart';

final myCustomScrollView = CustomScrollView(
  controller: ScrollController(),
  physics: null,
  shrinkWrap: true,
  clipBehavior: Clip.antiAlias,
  scrollDirection: Axis.horizontal,
  reverse: true,
  primary: true,
  cacheExtent: 20,
  semanticChildCount: 20,
  center: null,
  slivers: [],
  scrollBehavior: ScrollBehavior(),
);
