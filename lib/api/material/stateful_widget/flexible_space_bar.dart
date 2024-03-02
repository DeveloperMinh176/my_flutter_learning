import 'package:flutter/material.dart';

final myFlexibleSpaceBar = FlexibleSpaceBar(
  stretchModes: [
    StretchMode.zoomBackground,
    StretchMode.blurBackground,
    StretchMode.fadeTitle
  ],
  centerTitle: true,
  title: Text('abc'),
  background: null,
);
