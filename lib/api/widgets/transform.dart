import 'package:flutter/material.dart';

final myTransform = Transform(
  transform: Matrix4.translationValues(0, 0, 0),
  alignment: Alignment.bottomCenter,
  child: null,
);

final myTransform1 = Transform.scale(
  scale: 0.5,
  scaleX: 0.3,
  scaleY: 0.1,
  alignment: Alignment.bottomCenter,
  child: null,
);

final myTransform2 = Transform.translate(
  offset: Offset(0, 0),
  child: null,
);
