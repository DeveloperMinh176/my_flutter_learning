import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final myNestedScrollView = NestedScrollView(
  floatHeaderSlivers: true,
  headerSliverBuilder: (context, innerBoxIsScrolled) {
    return [
      SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar()),
    ];
  },
  body: Builder(builder: (context) {
    return CustomScrollView(slivers: [
      SliverOverlapInjector(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      ),
      SliverList(
        delegate: SliverChildListDelegate([]),
      )
    ]);
  }),
);
