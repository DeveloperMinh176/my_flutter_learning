import 'package:flutter/material.dart';

final mySliverAppBar = SliverAppBar(
  leading: null,
  actions: [Icon(Icons.add_alert_outlined)],
  flexibleSpace: FlexibleSpaceBar(),
  title: Text("Title"),
  bottom: null,
  shadowColor: null,
  scrolledUnderElevation: 4.0,
  titleTextStyle: TextStyle(),
  backgroundColor: Colors.amber,
  foregroundColor: Colors.amber,
  clipBehavior: Clip.hardEdge,
  elevation: 20,
  pinned: true,
  expandedHeight: 200,
  snap: true,
  floating: true,
  stretch: true,
  onStretchTrigger: () async {},
  stretchTriggerOffset: 10,
);
