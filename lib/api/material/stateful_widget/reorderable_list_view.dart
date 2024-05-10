import 'package:flutter/material.dart';

final myReorderabeListView = ReorderableListView(
    header: Text('abc'),
    children: [],
    onReorder: (oldIndex, newIndex) {},
    padding: EdgeInsets.all(40),
    proxyDecorator: (child, index, animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Material();
        },
        child: child,
      );
    });
